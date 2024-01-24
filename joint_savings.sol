/# @TODO:
# From `crypto_wallet.py import the functions generate_account, get_balance,
#  and send_transaction
# YOUR CODE HERE
from crypto_wallet import generate_account, get_balance, send_transaction

################################################################################
# KryptoJobs2Go Candidate Information

# Database of KryptoJobs2Go candidates including their name, digital address, rating and hourly cost per Ether.
# A single Ether is currently valued at $1,500
candidate_database = {
    "Lane": [
        "Lane",
        "0xaC8eB8B2ed5C4a0fC41a84Ee4950F417f67029F0",
        "4.3",
        0.20,
        "Images/lane.jpeg",
    ],
    "Ash": [
        "Ash",
        "0x2422858F9C4480c2724A309D58Ffd7Ac8bF65396",
        "5.0",
        0.33,
        "Images/ash.jpeg",
    ],
    "Jo": [
        "Jo",
        "0x8fD00f170FDf3772C5ebdCD90bF257316c69BA45",
        "4.7",
        0.19,
        "Images/jo.jpeg",
    ],
    "Kendall": [
        "Kendall",
        "0x8fD00f170FDf3772C5ebdCD90bF257316c69BA45",
        "4.1",
        0.16,
        "Images/kendall.jpeg",
    ],
}

# A list of the KryptoJobs2Go candidates first names
people = ["Lane", "Ash", "Jo", "Kendall"]


def get_people():
    """Display the database of KryptoJobs2Go candidate information."""
    db_list = list(candidate_database.values())

    for number in range(len(people)):
        st.image(db_list[number][4], width=200)
        st.write("Name: ", db_list[number][0])
        st.write("Ethereum Account Address: ", db_list[number][1])
        st.write("KryptoJobs2Go Rating: ", db_list[number][2])
        st.write("Hourly Rate per Ether: ", db_list[number][3], "eth")
        st.text(" \n")


################################################################################
# Streamlit Code

# Streamlit application headings
st.markdown("# KryptoJobs2Go!")
st.markdown("## Hire A Fintech Professional!")
st.text(" \n")

################################################################################
# Streamlit Sidebar Code - Start

st.sidebar.markdown("## Client Account Address and Ethernet Balance in Ether")

##########################################
# Step 1 - Part 4:
# Create a variable named `account`. Set this variable equal to a call on the
# `generate_account` function. This function will create the KryptoJobs2Go
# customer's (in this case, your) HD wallet and Ethereum account.

# @TODO:
#  Call the `generate_account` function and save it as the variable `account`
# YOUR CODE HERE
account = generate_account()
##########################################

# Write the client's Ethereum account address to the sidebar
st.sidebar.write(account.address)

##########################################
# Step 1 - Part 5:
# Define a new `st.sidebar.write` function that will display the balance of the
# customer's account. Inside this function, call the `get_balance` function and
#  pass it your Ethereum `account.address`.

# @TODO
# Call `get_balance` function and pass it your account address
# Write the returned ether balance to the sidebar
# YOUR CODE HERE
ether = get_balance(account.address)

##########################################

# Create a select box to chose a FinTech Hire candidate
person = st.sidebar.selectbox("Select a Person", people)

# Create a input field to record the number of hours the candidate worked
hours = st.sidebar.number_input("Number of Hours")

st.sidebar.markdown("## Candidate Name, Hourly Rate, and Ethereum Address")

# Identify the FinTech Hire candidate
candidate = candidate_database[person][0]

# Write the KryptoJobs2Go candidate's name to the sidebar
st.sidebar.write(candidate)

# Identify the KryptoJobs2Go candidate's hourly rate
hourly_rate = candidate_database[person][3]

# Write the inTech Finder candidate's hourly rate to the sidebar
st.sidebar.write(hourly_rate)

# Identify the KryptoJobs2Go candidate's Ethereum Address
candidate_address = candidate_database[person][1]

# Write the inTech Finder candidate's Ethereum Address to the sidebar
st.sidebar.write(candidate_address)

# Write the KryptoJobs2Go candidate's name to the sidebar

st.sidebar.markdown("## Total Wage in Ether")

################################################################################
# Step 2: Sign and Execute a Payment Transaction

# Complete the following steps:

# 1. KryptoJobs2Go customers will select a fintech professional from the
# application interface's drop-down menu, and then input the amount of time for
# which they'll hire the worker. Code the application so that once a customer
# completes these steps, the application will calculate the amount that the
# worker will be paid in ether. To do so, complete the following steps:

# * Write the equation that calculates the candidate's wage. This equation
#  should assess the candidate's hourly rate from the candidate database
# (`candidate_database[person][3]`) and then multiply this hourly rate by
# the value of the `hours` variable. Save this calculation's output as a
# variable named `wage`.

# * Write the `wage` variable to the Streamlit sidebar by
# using `st.sidebar.write`.

# 2. Now that the application can calculate a candidate's wage, write the code
# that will allow a customer (you, in this case) to send an Ethereum blockchain
# transaction that pays the hired candidate. To accomplish this, locate the
# code that reads `if st.sidebar.button("Send Transaction")`. You'll need to
# add logic to this `if` statement that sends the appropriate information to
# the `send_transaction` function (which you imported from the `crypto_wallet`
# script file). Inside the `if` statement, add the following functionality:

# * Call the `send_transaction()` function and pass it three parameters:
# - Your Ethereum `account` information. (Remember that this `account`
# instance was created when the `generate_account` function was called.)
#  From the `account` instance, the application will be able to access the
#  `account.address` information that is needed to populate the `from` data
# attribute in the raw transaction.
# - The `candidate_address` (which will be created and identified in the
# sidebar when a customer selects a candidate). This will populate the `to`
# data attribute in the raw transaction.
# - The `wage` value. This will be passed to the `toWei` function to
# determine the wei value of the payment in the raw transaction.

# * Save the transaction hash that the `send_transaction` function returns
# as a variable named `transaction_hash`, and have it display on the
# application's web interface.

##########################################
# Step 2 - Part 1:
# * Write the equation that calculates the candidate's wage. This equation
# should assess the candidate's hourly rate from the candidate database
# (`candidate_database[person][3]`) and then multiply this hourly rate by
# the value of the `hours` variable. Save this calculation's output as a
# variable named `wage`.
# * Write the `wage` variable to the Streamlit sidebar by using `st.sidebar.write`.

# @TODO
# Calculate total `wage` for the candidate by multiplying the candidate's hourly
# rate from the candidate database (`candidate_database[person][3]`) by the
# value of the `hours` variable
# YOUR CODE HERE
wage = candidate_database[person][3] * hours
# @TODO
# Write the `wage` calculation to the Streamlit sidebar
# YOUR CODE HERE
st.sidebar.write(f"Wage: {wage}")