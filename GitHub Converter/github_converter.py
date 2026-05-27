import os
import openai
import json

openai.api_key = os.environ.get("OPENAI_API_KEY")
if not openai.api_key:
    raise RuntimeError("Set OPENAI_API_KEY environment variable before running this script.")

FOLDER_PATH = "../GitHub Lua Wiki/pytha-lua-api.wiki"  
MATCH_KEYWORDS = ["pytha.", "pyui.", "pyux.", "pyio."]

def should_include_file(filename):
    return any(keyword in filename for keyword in MATCH_KEYWORDS)

def convert_markdown_to_lua_via_chatgpt(content):
    prompt = f"""
You are a converter tool. Convert the following Markdown content into a content that is usable in a stub definition code extension for the Lua Language Server in a visual studio code extension.
The result should be similar to this which has been created for the file pytha.create_block:


---**Creates a 3D block with specified dimensions** 
---[View documents](https://github.com/pytha-3d-cad/pytha-lua-api/wiki/pytha.create_block)
---@param length number Length of the block (in x-direction) 
---@param width number Width of the block (in y-direction)
---@param height number Height of the block (in z-direction)
---@param origin? Origin Optional: origin point of the block
---@param options? table Optional: a table that may contain the following options:
---@return userdata An element handle of the newly created part
function pytha.create_block(length, width, height, origin, options) end

The web address is always https://github.com/pytha-3d-cad/pytha-lua-api/wiki/ followed by the function name

The returned content must be valid lua format with comments. Do not give any explanations.


Here is the markdown content:
{content}
"""
    try:
        response = openai.chat.completions.create(
            model="gpt-4o",  # or "gpt-3.5-turbo"
            messages=[
                {"role": "system", "content": "You are a Lua formatter."},
                {"role": "user", "content": prompt}
            ],
            temperature=0.3,
            max_tokens=2000
        )
        return response.choices[0].message.content
    except Exception as e:
        print(f"Error calling ChatGPT: {e}")
        return None

def main():
    for filename in os.listdir(FOLDER_PATH):
        if should_include_file(filename):
            filepath = os.path.join(FOLDER_PATH, filename)
            try:
                with open(filepath, "r", encoding="utf-8") as file:
                    content = file.read()
                    print(f"\n--- Processing: {filename} ---")
                    lua_result = convert_markdown_to_lua_via_chatgpt(content)
                    if lua_result:
                        print(lua_result)
                        with open("C:\\Users\\fflas\\pytha-lua-support\\libs\\pytha.lua", "a", encoding="utf-8") as lua_file:
                            #lua_file.write("\n-- Converted from Markdown\n")
                            lua_file.write(lua_result)
                            lua_file.write("\n\n")
                    else:
                        print("Failed to get conversion.")
            except Exception as e:
                print(f"Failed to read {filename}: {e}")

if __name__ == "__main__":
    main()