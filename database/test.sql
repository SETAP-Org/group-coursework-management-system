/*
CREATE TABLES FOR GROUP COURSEWORK PROJECT MANAGEMENT SYSTEM 
*/

CREATE TABLE USERS(
    user_id SERIAL PRIMARY KEY,
    user_first_name VARCHAR(50) NOT NULL,
    user_last_name VARCHAR(50) NOT NULL,
    user_email VARCHAR(100) NOT NULL UNIQUE,
    date_created TIMESTAMP,
    last_login TIMESTAMP,
    UNIQUE (user_email)
);

CREATE TABLE PROJECTS(
    project_id SERIAL PRIMARY KEY,
    team_leader_id INT NOT NULL,
    project_board TEXT,
    project_name VARCHAR(50) NOT NULL,
    project_deadline DATE NOT NULL,
    p_date_created TIMESTAMP,
    p_time_updated TIMESTAMP,
    FOREIGN KEY (team_leader_id) REFERENCES USERS(user_id)
);

CREATE TABLE USER_PROJECTS(
    user_id INT NOT NULL,
    project_id INT NOT NULL,
    PRIMARY KEY (user_id, project_id),
    FOREIGN KEY (user_id) REFERENCES USERS(user_id),
    FOREIGN KEY (project_id) REFERENCES PROJECTS(project_id)
);

CREATE TYPE task_status AS ENUM ('To Do', 'In Progress', 'Completed');