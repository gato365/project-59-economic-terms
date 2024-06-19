import pandas as pd
import random

# Read data from an Excel file
def read_data_from_excel(file_path):
    df = pd.read_excel(file_path)
    # Assuming the Excel columns are named similarly to your database headings
    return [(row['Concept'], row['Unit Name'], row['Abbreviated Definition']) for index, row in df.iterrows()]

# Select a question function remains the same
def select_question(data, unit):
    questions = [q for q in data if q[1] == unit]
    return random.choice(questions) if questions else None

# Generate options function remains the same
def generate_options(data, correct, unit):
    wrong_answers = [q for q in data if q[1] != unit]
    same_unit_wrong = [q for q in data if q[1] == unit and q[0] != correct[0]]
    selected_wrong = random.sample(wrong_answers, 3) + random.sample(same_unit_wrong, 2)
    options = selected_wrong + [correct]
    random.shuffle(options)
    return options

# Main function slightly modified to read data from Excel
def run_quiz():
    file_path = 'micoeconomics_concepts.xlsx'  # Path to the Excel file
    data = read_data_from_excel(file_path)
    
    unit = int(input("Enter the unit number: "))
    num_questions = int(input("How many questions would you like? "))
    
    for _ in range(num_questions):
        question = select_question(data, unit)
        if not question:
            print("No questions available for this unit.")
            continue
        
        options = generate_options(data, question, unit)
        print(f"\nWhat is the abbreviated definition of {question[0]}?")
        for idx, option in enumerate(options, 1):
            print(f"{idx}. {option[2]}")
        
        answer = int(input("Your answer (1-6): "))
        if options[answer - 1] == question:
            print("Correct!\n")
        else:
            print("Incorrect. The correct answer was:", question[2], "\n")

if __name__ == "__main__":
    run_quiz()
