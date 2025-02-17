# Catering Company Management System  
**Comprehensive SQL-Based System for Catering Operations**

## Overview  
This repository contains the code and resources for a complete Catering Company Management System designed to streamline and enhance the operations and event management for catering companies. The system focuses on effective SQL database management and includes modules for:

![image](https://github.com/user-attachments/assets/a1603b3d-5ef9-4daf-b8e6-e27856b75b5d)


- **Human Resources Management:** Efficient scheduling and role management.
- **Client Management:** Detailed records of client interactions, preferences, and event histories.
- **Inventory Management:** Tracking and managing food and equipment inventory to ensure optimal stock levels and minimize waste.
- **Supplier Management:** Managing supplier details, orders, and delivery schedules for timely procurement.
- **Event Management:** Comprehensive planning and execution of events, including scheduling, budgeting, and resource allocation with cost/revenue analysis.
- **Database Management:** Robust SQL scripts to create, manage, and query the catering management database for reliable data storage and retrieval.

## Table of Contents  
- [Overview](#overview)  
- [Key Features](#key-features)  
- [Installation](#installation)  
- [Usage](#usage)  
- [Database Setup & SQL Scripts](#database-setup--sql-scripts)  
- [Documentation](#documentation)  
- [Contributing](#contributing)  
- [License](#license)  
- [Contact](#contact)

## Key Features  
- **Human Resources Management:**  
  Efficiently manage staff schedules, assignments, and roles.

- **Client Management:**  
  Maintain detailed records of client interactions, preferences, and event histories.

- **Inventory Management:**  
  Track and manage food and equipment inventory to ensure optimal stock levels and reduce waste.

- **Supplier Management:**  
  Manage supplier information, orders, and delivery schedules for cost-effective procurement.

- **Event Management:**  
  Plan and execute events with features for scheduling, budgeting, and resource allocation—including cost and revenue calculations.

- **Database Management:**  
  Implemented using SQL scripts that create, manage, and query the catering management database to ensure efficient data storage and retrieval.

## Installation  
1. **Clone the Repository:**  
   ```bash
   git clone https://github.com/yourusername/Catering_Company_Management_System.git
   cd Catering_Company_Management_System
   ```

2. **Install Dependencies:**  
   Depending on your tech stack, run one of the following:
   - For a Node.js-based stack:  
     ```bash
     npm install
     ```
   - For a Python-based stack:  
     ```bash
     pip install -r requirements.txt
     ```

3. **Database Setup:**  
   Execute the SQL scripts found in the `/database` directory to set up the database schema and insert sample data. For example:
   ```bash
   mysql -u yourusername -p < database/PROJECT_DATA_bASE.SQL
   mysql -u yourusername -p < database/RANDOM_DATA.SQL
   ```

4. **Configure Application Settings:**  
   Update any necessary configurations in the `/config` directory to match your environment.

## Usage  
1. **Start the Application:**  
   Run the appropriate command based on your stack:
   - For Node.js:  
     ```bash
     npm start
     ```
   - For Python:  
     ```bash
     python app.py
     ```

2. **Access Documentation:**  
   Detailed instructions, user guides, and API documentation are provided in the `/docs` directory.

## Database Setup & SQL Scripts  
This repository includes several SQL scripts to manage the catering management database:

- **PROJECT_DATA_bASE.SQL:**  
  Creates the database schema, including tables for persons, customers, employees (with specialized roles such as waiters and chefs), dishes, suppliers, events, and various junction tables.

- **QUERIES.SQL:**  
  Contains sample queries addressing business needs, such as:
  - Calculating total kosher sales per event.
  - Summing final payments to suppliers.
  - Ranking chefs by event participation.
  - Updating customer status based on recent event activity.
  - Analyzing popular dishes and financial trends.

- **RANDOM_DATA.SQL:**  
  Inserts sample records into the database for testing and demonstration purposes.

Additionally, a stored procedure (`calculate_finale_payment`) is provided to dynamically calculate event payments based on dish quantities and guest counts.

## Documentation  
Comprehensive documentation is available in the `/docs` directory and includes:
- Detailed setup instructions.
- User guides for each module (HR, client management, inventory, supplier management, and event management).
- API documentation (if applicable) and sample queries.
- ER diagrams and presentation slides explaining system objectives, challenges, and business requirements.

## Contributing  
Contributions are welcome! Please review the [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines on submitting pull requests and reporting issues.

## License  
This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for full details.

## Contact  
For questions, feedback, or collaboration opportunities, please contact:  

**Shoval Benjer**  
Creative Data Scientist | Tel Aviv - Jaffa, ISR  
GitHub: [ShovalBenjer](https://github.com/ShovalBenjer)  
Email: shovalb9@gmail.com  
