def run_quiz():
    questions = [
        {
            "question": "What is the capital of France?",
            "choices": ['A) Madrid', 'B) Berlin', 'C) Paris', 'D) London'],
            "answer": "C"
        },
        {
            "question": "Which language is primarily used for Android app development?",
            "choices": ['A) Java', 'B) Python', 'C) Swift', 'D) Kotlin'],
            "answer": "D"
        },
        {
            "question": "What does HTML stand for?",
            "choices": ['A) Hyper Trainer Marking Language', 'B) Hyper Text Markup Language', 'C) Hyper Text Markdown Language', 'D) Hyper Tech Markup Language'],
            "answer": "B"
        }
    ]

    score = 0

    for question in questions:
        print("\n" + question["question"])
        for choice in question["choices"]:
            print(choice)
        user_answer = input("Enter your answer (A, B, C, or D): ").upper()

        if user_answer == question["answer"]:
            print("Correct!")
            score += 1
        else:
            print("Wrong!")
def run_quiz():
    questions = [
        {
            "question": "What is the capital of France?",
            "choices": ['A) Madrid', 'B) Berlin', 'C) Paris', 'D) London'],
            "answer": "C"
        },
        {
            "question": "Which language is primarily used for Android app development?",
            "choices": ['A) Java', 'B) Python', 'C) Swift', 'D) Kotlin'],
            "answer": "D"
        },
        {
            "question": "What does HTML stand for?",
            "choices": ['A) Hyper Trainer Marking Language', 'B) Hyper Text Markup Language', 'C) Hyper Text Markdown Language', 'D) Hyper Tech Markup Language'],
            "answer": "B"
        }
    ]

    score = 0

    for question in questions:
        print("\n" + question["question"])
        for choice in question["choices"]:
            print(choice)
        user_answer = input("Enter your answer (A, B, C, or D): ").upper()

        if user_answer == question["answer"]:
            print("Correct!")
            score += 1
        else:
            print("Wrong!")

    print(f"\nYou got {score} out of {len(questions)} correct.")

if __name__ == "__main__":
    run_quiz()

    print(f"\nYou got {score} out of {len(questions)} correct.")

if __name__ == "__main__":
    run_quiz()
