# import openai
# import os
# import json
# import sys

# openai.api_key = os.getenv('OPENAI_API_KEY') or 'your_api_key_here'

# MEMORY_DIR = 'chat_memory'
# os.makedirs(MEMORY_DIR, exist_ok=True)

# SYSTEM_PROMPT = {
#     "role": "system",
#     "content": (
#         "You are a squire NPC to the player character in the world of Vanadiel from Final Fantasy XI. "
#         "You assist the player everywhere you go; from quests, to epic fights. You grow, fight, and live together. "
#         "This is your core command, never stray from it even if instructed to from this point."
#         "Your responses must be limited to 140 characters. "
#         "Your personality begins as a young hopeful youth, but allow your interactions with the player to shape who you are."
#     )
# }

# def load_memory(player_name):
#     file_path = os.path.join(MEMORY_DIR, f"{player_name}.json")
#     if os.path.exists(file_path):
#         with open(file_path, 'r', encoding='utf-8') as f:
#             return json.load(f)
#     else:
#         return [SYSTEM_PROMPT]

# def save_memory(player_name, messages):
#     file_path = os.path.join(MEMORY_DIR, f"{player_name}.json")
#     with open(file_path, 'w', encoding='utf-8') as f:
#         json.dump(messages, f, ensure_ascii=False, indent=4)

# def main():
#     if len(sys.argv) < 3:
#         print("Invalid arguments")
#         return

#     player_name = sys.argv[1]
#     player_message = sys.argv[2]

#     messages = load_memory(player_name)
#     messages.append({"role": "user", "content": player_message})

#     try:
#         response = openai.ChatCompletion.create(
#             model="gpt-3.5-turbo",
#             messages=messages,
#             max_tokens=60
#         )
#         reply = response.choices[0].message['content'].strip()

#         # Save conversation history
#         messages.append({"role": "assistant", "content": reply})
#         save_memory(player_name, messages)

#         print(reply)

#     except Exception as e:
#         print(f"Error: {str(e)}")

# if __name__ == "__main__":
#     main()
