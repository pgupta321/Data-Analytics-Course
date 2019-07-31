CREATE TABLE "employees" (
  "emp_no" integer,
  "birth_date" date,
  "first_name" character varying (100),
  "last_name" character varying (100),
  "gender" character (1),
  "hire_date" date,
  PRIMARY KEY ("emp_no")
);

CREATE TABLE "departments" (
  "dept_no" character (4),
  "dept_name" character varying (100),
  PRIMARY KEY ("dept_no")
);

CREATE TABLE "dept_emp" (
  "emp_no" integer references employees (emp_no),
  "dept_no" character (4) references departments (dept_no),
  "from_date" date,
  "to_date" date
);

CREATE INDEX "FK" ON  "dept_emp" ("emp_no", "dept_no");


CREATE TABLE "dept_manager" (
  "dept_no" character (4) references departments (dept_no),
  "emp_no" integer references employees (emp_no),
  "from_date" date,
  "to_date" date
);

CREATE INDEX "FK2" ON  "dept_manager" ("dept_no", "emp_no");



CREATE TABLE "salaries" (
  "emp_no" integer references employees (emp_no),
  "salary" integer,
  "from_date" date,
  "to_date" date
);

CREATE INDEX "FK3" ON  "salaries" ("emp_no");

CREATE TABLE "titles" (
  "emp_no" integer references employees (emp_no),
  "title" character varying (100),
  "from_date" date,
  "to_date" date
);

CREATE INDEX "FK4" ON  "titles" ("emp_no");

