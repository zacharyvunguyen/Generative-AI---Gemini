![BQAPP.gif](imgs%2FBQAPP.gif)
# Conversational Data Insights with Gemini
![function_calling.png](imgs%2Ffunction_calling.png)
## Overview
Conversational Data Insights with Gemini demonstrates the power of Gemini's Function Calling capabilities, enabling users to query and understand their BigQuery databases using natural language. Forget complex SQL syntax – interact with your data conversationally.

## Key Features
- **Natural Language Querying**: Allows users to query BigQuery databases using plain English.
- **Function Calling with Gemini**: Utilize Gemini's advanced function calling capabilities to generate and execute queries based on natural language descriptions.

## Getting Started

### Prerequisites
- Google Cloud account
- BigQuery dataset
- Service account with BigQuery access
- Python environment with required libraries

### Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-repo/conversational-data-insights.git
   cd conversational-data-insights
   ```

2. **Install Dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Set Up Google Cloud Authentication**
   Set the path to your service account key file:
   ```python
   os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "/path/to/your/service_account.json"
   ```

4. **Configure Your BigQuery Dataset**
   Set the BigQuery dataset ID in your configuration:
   ```python
   BIGQUERY_DATASET_ID = "your_dataset_id"
   ```

### Running the Application

1. **Run the Streamlit App**
   ```bash
   streamlit run app.py
   ```

2. **Interact with the Application**
   Open your web browser and navigate to the local URL provided by Streamlit. Use natural language to query your BigQuery dataset and explore the data interactively.

## Usage

### Example Queries
- What kind of information is in this database?
- What percentage of orders are returned?
- How is inventory distributed across our regional distribution centers?
- Do customers typically place more than one order?
- Which product categories have the highest profit margins?

### Viewing Function Details
The application logs all function calls, parameters, and responses, which can be viewed by expanding the relevant sections in the interface.

## Technical Details

### Code Explanation

#### Session State Initialization
```python
if "messages" not in st.session_state:
    st.session_state.messages = []
```
This ensures that the `messages` key is present in the session state to store chat history.

#### Capturing User Input
```python
if prompt := st.chat_input("Ask me about information in the database..."):
    st.session_state.messages.append({"role": "user", "content": prompt})
    ...
```
Captures the user's natural language query and appends it to the session state.

#### Processing AI Response
```python
chat = model.start_chat()
client = bigquery.Client()
response = chat.send_message(prompt)
...
```
Initializes the chat with the generative AI model, sends the user's prompt, and processes the response.

#### Handling Function Calls
```python
while function_calling_in_process:
    ...
    if response.function_call.name == "list_datasets":
        api_response = client.list_datasets()
    ...
```
Handles various function calls (e.g., listing datasets, tables, running SQL queries) and interacts with BigQuery to retrieve data.

#### Displaying Responses
```python
st.markdown(full_response.replace("$", "\$"))
```
Displays the AI-generated response in the chat interface.

## Contributing
Contributions are welcome! Please fork the repository and submit pull requests for any enhancements or bug fixes.

## License
This project is licensed under the MIT License.

## Contact
For any questions or support, please contact [Zachary Nguyen](https://www.linkedin.com/in/zacharyvunguyen/) on LinkedIn.