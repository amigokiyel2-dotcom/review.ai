# SmartQuiz AI Generator

An intelligent quiz generator that uses advanced Natural Language Processing (NLP) and Machine Learning to automatically create customized quizzes from your study materials.

## Features

- **Multi-Format Support**: Upload PowerPoint (PPTX), PDF, Word (DOCX), or plain text files
- **AI-Powered Question Generation**: Automatically generates intelligent questions using NLP and TF-IDF algorithms
- **Multiple Question Types**: 
  - Multiple Choice Questions (MCQ)
  - True/False Questions
  - Mixed Mode (combination of both)
- **Key Topic Extraction**: Automatically identifies and displays key topics from your content
- **Instant Feedback**: Get detailed scoring with correct/incorrect answer breakdown
- **Topic Performance Visualization**: Compare topic accuracy with labeled progress bars and identify topics scoring below 70% for review
- **Personalized Study Plan**: Get prioritized review suggestions and relevant source material for topics that need work
- **Performance Across Attempts**: Compare scores and attempt history during the current browser session
- **Optional Results Download**: Download a PDF reviewer containing only quiz questions, choices, and correct answers
- **User-Friendly Interface**: Clean, modern Streamlit web interface
- **Interactive Experience**: Real-time quiz generation and evaluation

## Technologies Used

- **Python 3.x**
- **Streamlit**: Web application framework
- **NLTK**: Natural Language Processing
- **scikit-learn**: Machine Learning (TF-IDF, cosine similarity)
- **python-pptx**: PowerPoint file processing
- **PyPDF2**: PDF file processing
- **python-docx**: Word document processing
- **NumPy**: Numerical computations

## Prerequisites

- Python 3.7 or higher
- Virtual environment (venv)
- Windows OS (for batch file execution)

## Installation

1. **Clone or download this repository**

2. **Create a virtual environment**:
   ```bash
   python -m venv .venv
   ```

3. **Activate the virtual environment**:
   ```bash
   .venv\Scripts\activate
   ```

4. **Install required dependencies**:
   ```bash
pip install streamlit nltk scikit-learn python-pptx PyPDF2 python-docx numpy reportlab PyMySQL
   ```

5. **Download required NLTK data** (will be done automatically on first run):
   - punkt tokenizer
   - punkt_tab tokenizer
   - stopwords corpus

## XAMPP MySQL Setup

Account registration and sign-in use the MySQL/MariaDB server bundled with
XAMPP. Start **MySQL** in the XAMPP Control Panel, then copy
`.streamlit/secrets.toml.example` to `.streamlit/secrets.toml` if needed. Set
the connection values in `[mysql]`. The defaults target a local XAMPP install
with the `root` account and no password. The app creates the `smartquiz`
database and required tables on first use. You can also import
`xampp_migration.sql` in phpMyAdmin to create them manually.

New accounts are stored in MySQL with salted PBKDF2 password hashes. They can
sign in immediately; email verification is not configured in this local
XAMPP setup. Existing Supabase credentials are no longer used for app sign-in.
Keep `secrets.toml` private; it is excluded from version control. For a
deployed site, configure a dedicated MySQL user with a strong password instead
of using XAMPP's local default `root` account.

## Usage

### Method 1: Using Batch File (Windows)

Simply double-click `run_app.bat` or run:
```bash
run_app.bat
```

### Method 2: Using Command Line

1. Activate the virtual environment:
   ```bash
   .venv\Scripts\activate
   ```

2. Run the Streamlit application:
   ```bash
   streamlit run app.py
   ```

3. The application will open in your default web browser at `http://localhost:8501`

### Stopping the Application

- Close the terminal window, or
- Press `Ctrl+C` in the terminal, or
- Use `stop_app.bat` if available

## How to Use the Application

1. **Choose Input Method**:
   - **Upload File**: Select a PPTX, PDF, DOCX, or TXT file from your computer
   - **Enter Text**: Paste your study material directly into the text area

2. **Configure Quiz Settings**:
   - Select the number of questions (5-50)
   - Choose question type:
     - Mixed (MCQ + True/False)
     - Multiple Choice Only
     - True/False Only

3. **Generate Quiz**:
   - Click the "Generate Quiz" button
   - Wait for the AI to process your content
   - View the automatically detected key topics

4. **Take the Quiz**:
   - Answer each question by selecting an option
   - Click "Submit Quiz" when finished

5. **View Results**:
   - See your score and percentage
   - View score summary cards and a labeled accuracy bar for each detected topic
   - Review topics with scores below 70%
   - Follow the personalized study plan and revisit relevant source material
   - Compare scores across quiz attempts in the current browser session
   - Review detailed feedback for each question
   - See correct answers for questions you got wrong
   - Optionally download a PDF containing only the questions, choices, and correct answers
   - Generate a new quiz to practice more

## How It Works

1. **Text Extraction**: Extracts text from uploaded files using format-specific parsers
2. **Preprocessing**: 
   - Tokenizes text into sentences and words
   - Removes stopwords (common words like "the", "is", etc.)
   - Applies Porter Stemming for word normalization
3. **Topic Extraction**: Uses TF-IDF (Term Frequency-Inverse Document Frequency) to identify key topics
4. **Question Generation**:
   - **MCQ**: Identifies key entities/concepts and creates fill-in-the-blank style questions
   - **True/False**: Either uses original sentences or modifies them to create false statements
5. **Scoring**: Compares user answers with correct answers and provides instant feedback

## Project Structure

```text
app.py                    # Streamlit entry point
smartquiz/
  dashboard.py            # Streamlit sign-in and quiz interface
  pdf_export.py           # Reviewer PDF generation
  quiz.py                 # File extraction and quiz generation
  mysql_auth.py           # MySQL email registration and sign-in
.streamlit/
  config.toml             # Streamlit theme
  secrets.toml.example    # OAuth and MySQL configuration template
run_app.bat               # Windows launcher
stop_app.bat              # Windows stop script
README.md                 # Setup and usage instructions
```

## Configuration

The application uses the following default settings:
- **Port**: 8501
- **Question Range**: 5-50 questions
- **Max Topics**: 5 key topics extracted
- **TF-IDF Features**: Based on content size

## Troubleshooting

### NLTK Data Not Found
If you encounter NLTK data errors, run in Python:
```python
import nltk
nltk.download('punkt')
nltk.download('punkt_tab')
nltk.download('stopwords')
```

### Port Already in Use
If port 8501 is already in use, modify the `run_app.bat` file to use a different port:
```batch
%STREAMLIT_EXE% run app.py --server.port 8502
```

### File Upload Issues
- Ensure files are not password-protected
- Check that files contain actual text content (not scanned images)
- Try different file formats if one doesn't work

## Best Practices

- **Quality Content**: Better input content generates better questions
- **Length**: Aim for at least 500 words of content for best results
- **Structure**: Well-structured content (headings, paragraphs) produces better topic extraction
- **File Format**: Text-based PDFs work better than scanned images

## Future Enhancements

- Support for image-based PDFs (OCR)
- Export quiz to PDF or Word format
- Save and load quiz history
- Difficulty level selection
- Custom question templates
- Multi-language support
- Answer explanations

## License

This project is open source and available for educational purposes.

**Happy Learning!**
