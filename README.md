# DBT Project Setup and Features (Refer attachment)

## Initial Setup

### 1. Create a Snowflake Account
- Sign up for a Snowflake account if you don't have one.
- Set up your account and obtain the necessary connection details.

### 2. Run the DDL and Data Load
- Execute the provided DDL scripts to create the necessary tables in your Snowflake database.
- Load the initial data into these tables.

### 3. Set Up DBT Connection
- Configure the connection to your Snowflake account in your dbt project by updating the `dbt_project.yml` file with the appropriate connection details.
- Include the properties.yml in the models folder

### 4. Load `dim_states` into a CSV File
- Save the `dim_states` data into a CSV file.
- Place this CSV file in the `seeds` folder of your dbt project.

### 5. Include `generate_schema` Macro
- Create a new macro file under the `macros` folder.
- Define the `generate_schema` macro in this file- refer attachment.

### 6. Refer to Demo Day2 for Snapshot and Incremental
- For examples of how to implement snapshots and incremental models, refer to the `demo_day2` project files.

## DBT Features Covered

### Generating Tables Under Custom Schema
- Learn how to create and manage tables in custom schemas within your dbt project.

### Macros
- Understand the use and creation of macros to automate and simplify repetitive tasks.

### Incremental Strategy
- Implement incremental models to handle large datasets efficiently by processing only new or changed data.

### Relationships Test
- Use relationship tests to ensure data integrity and validate foreign key relationships between tables.

### Snapshot for SCD Type 2
- Implement snapshots to capture historical changes and maintain slowly changing dimensions (SCD) Type 2.

## Future Scope

### 1. Remove Left Join and Test Relationships with Different Scope
- Improve data model relationships by testing joins with completely different scopes, especially where there are joins between `restaurants` and `cuisines`.

### 2. Snapshot Customization with Custom Column Names
- Customize snapshots to use specific column names for tracking changes, such as `valid_from` and `valid_to`.

### 3. Create More Insights with New Views
- Develop new views to provide additional insights and support more complex analytics.

## Example DBT Project Structure

