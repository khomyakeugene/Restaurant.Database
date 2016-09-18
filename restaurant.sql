/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     10.09.2016 10:36:05                          */
/*==============================================================*/
/*==============================================================*/
/* Table: action_dic                                            */
/*==============================================================*/
create table action_dic (
   action_type          CHAR(1)              not null,
   name                 VARCHAR(256)         not null,
   constraint PK_ACTION_DIC primary key (action_type)
);

INSERT INTO action_dic
       (action_type, name)
VALUES ('A', 'Creation');
INSERT INTO action_dic
       (action_type, name)
VALUES ('B', 'Removal');
INSERT INTO action_dic
       (action_type, name)
VALUES ('C', 'Filling');
INSERT INTO action_dic
       (action_type, name)
VALUES ('D', 'Closing');
INSERT INTO action_dic
       (action_type, name)
VALUES ('E', 'Viewing');



/*==============================================================*/
/* Index: action_dic_PK                                         */
/*==============================================================*/
create unique index action_dic_PK on action_dic (
action_type
);

/*==============================================================*/
/* Table: common_data_dic                                       */
/*==============================================================*/
create table common_data_dic (
   common_data_id       SERIAL               not null,
   name                 VARCHAR(256)         not null,
   value                VARCHAR(256)         null,
   image                BYTEA                null,
   constraint PK_COMMON_DATA_DIC primary key (common_data_id),
   constraint AK_U_COMMON_DATA_COMMON_D unique (name)
);

INSERT INTO common_data_dic
       (common_data_id, name, value)
VALUES (1, 'name', 'Hamster');
INSERT INTO common_data_dic
       (common_data_id, name)
VALUES (2, 'emblem');
INSERT INTO common_data_dic
       (common_data_id, name, value)
VALUES (3, 'address', 'New Street, 7');
INSERT INTO common_data_dic
       (common_data_id, name, value)
VALUES (4, 'phone number 1', '+380-44-111-22-33');
INSERT INTO common_data_dic
       (common_data_id, name, value)
VALUES (5, 'phone number 2', '+380-44-111-22-34');
INSERT INTO common_data_dic
       (common_data_id, name, value)
VALUES (6, 'phone number 3', '+380-67-123-45-67');
INSERT INTO common_data_dic
       (common_data_id, name, value)
VALUES (7, 'phone number 4', '+380-93-987-65-34');
INSERT INTO common_data_dic
       (common_data_id, name, value)
VALUES (8, 'e-mail', 'restaurant@hamster.com.ua');
INSERT INTO common_data_dic
       (common_data_id, name)
VALUES (9, 'transport map');
INSERT INTO common_data_dic
       (common_data_id, name)
VALUES (10, 'restaurant schema');

ALTER SEQUENCE common_data_dic_common_data_id_seq RESTART WITH 100;

/*==============================================================*/
/* Index: common_data_PK                                        */
/*==============================================================*/
create unique index common_data_PK on common_data_dic (
common_data_id
);

/*==============================================================*/
/* Table: cooked_course                                         */
/*==============================================================*/
create table cooked_course (
   cooked_course_id     SERIAL               not null,
   employee_id          INT4                 not null,
   course_id            INT4                 not null,
   cook_datetime        TIMESTAMP            not null default CURRENT_TIMESTAMP,
   weight               FLOAT8               not null,
   constraint PK_COOKED_COURSE primary key (cooked_course_id)
);

/*==============================================================*/
/* Index: cooked_course_PK                                      */
/*==============================================================*/
create unique index cooked_course_PK on cooked_course (
cooked_course_id
);

/*==============================================================*/
/* Index: cook_FK                                               */
/*==============================================================*/
create  index cook_FK on cooked_course (
employee_id
);

/*==============================================================*/
/* Index: cooked_course_course_FK                               */
/*==============================================================*/
create  index cooked_course_course_FK on cooked_course (
course_id
);

/*==============================================================*/
/* Table: course                                                */
/*==============================================================*/
create table course (
   course_id            SERIAL               not null,
   course_category_id   INT4                 not null,
   name                 VARCHAR(256)         not null,
   weight               FLOAT8               not null,
   cost                 FLOAT8               not null,
   photo                BYTEA                null,
   constraint PK_COURSE primary key (course_id),
   constraint AK_U_COURSE_COURSE unique (name)
);

/* Shopska salad */
INSERT INTO course
       (course_id, course_category_id, name, weight, cost)
VALUES (2001, 201, 'Shopska salad', 0.350, 45.0);

/* Chicken with mushrooms, cooked by Ihor Kvilinskyi's recipe */
INSERT INTO course
       (course_id, course_category_id, name, weight, cost)
VALUES (4001, 401, 'Chicken with mushrooms, cooked by Ihor Kvilinskyi-s recipe', 0.450, 98.0);

/* Goulash with potato */
INSERT INTO course
       (course_id, course_category_id, name, weight, cost)
VALUES (4002, 401, 'Goulash with potato ', 0.450, 87.0);

/* Beer "Doms", 0.5l bottle */
INSERT INTO course
       (course_id, course_category_id, name, weight, cost)
VALUES (10001, 7101, 'Beer "Doms", 0.5l bottle', 0.5, 20.0);

ALTER SEQUENCE course_course_id_seq RESTART WITH 10100;



/*==============================================================*/
/* Index: course_PK                                             */
/*==============================================================*/
create unique index course_PK on course (
course_id
);

/*==============================================================*/
/* Index: course_category_FK                                    */
/*==============================================================*/
create  index course_category_FK on course (
course_category_id
);

/*==============================================================*/
/* Table: course_category_dic                                   */
/*==============================================================*/
create table course_category_dic (
   course_category_id   SERIAL               not null,
   name                 VARCHAR(256)         not null,
   constraint PK_COURSE_CATEGORY_DIC primary key (course_category_id),
   constraint AK_U_COURSE_CATEGORY_COURSE_C unique (name)
);


INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (101, 'Appetizers');

INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (201, 'Salads');

INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (301, 'Soups');

INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (401, 'Entrees');

INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (501, 'Deserts');

INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (6001, 'Nonalcoholic beverages');

INSERT INTO course_category_dic
       (course_category_id, name)
       VALUES (7001, 'Alcoholic beverages');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7101, 'Beer');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7201, 'Cider');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7301, 'Wine');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7401, 'Brandy');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7501, 'Cognac');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7601, 'Whisky');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7701, 'Horilka');

ALTER SEQUENCE course_category_dic_course_category_id_seq RESTART WITH 10001;


/*==============================================================*/
/* Index: course_category_dic_PK                                */
/*==============================================================*/
create unique index course_category_dic_PK on course_category_dic (
course_category_id
);

/*==============================================================*/
/* Table: course_ingredient                                     */
/*==============================================================*/
create table course_ingredient (
   course_id            INT4                 not null,
   ingredient_id        INT4                 not null,
   portion_id           INT4                 null,
   amount               FLOAT8               null,
   constraint PK_COURSE_INGREDIENT primary key (ingredient_id, course_id)
);

/* Shopska salad */
/* Tomato, 400g */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (2001, 5, 1001, 0.400);
/* Cucumber 300g */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (2001, 6, 1001, 0.300);
/* White salad leek 100g */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (2001, 11, 1001, 0.100);
/* Ñapsicum (Áîëãàðñüêèé ïåðåöü), 400g */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (2001, 13, 1001, 0.400);
/* Brynza, 300g */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (2001, 601, 1001, 0.300);
/* Olive oil 70ml */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (2001, 303, 1002, 0.070);
/* Salt */
INSERT INTO course_ingredient
       (course_id, ingredient_id)
VALUES (2001, 101);
/* Black pepper */
INSERT INTO course_ingredient
       (course_id, ingredient_id)
VALUES (2001, 121);
/* Grape vinegar, 20ml */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (2001, 306, 1002, 0.020);

/* Chicken with mushrooms, cooked by Ihor Kvilinskyi's recipe */
/* Chicken fillet, 800g */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (4001, 401, 1001, 0.800);
/* Ñhampignon mushrooms, 800g */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (4001, 10, 1001, 0.800);
/* Onion, 400g */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (4001, 2, 1001, 0.400);
/* Refined sunflower oil, 0.15l */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (4001, 301, 4006, 0.150);
/* Salt */
INSERT INTO course_ingredient
       (course_id, ingredient_id)
VALUES (4001, 101);
/* Sugar */
INSERT INTO course_ingredient
       (course_id, ingredient_id)
VALUES (4001, 111);
/* Black pepper */
INSERT INTO course_ingredient
       (course_id, ingredient_id)
VALUES (4001, 121);
/* Bay leaf */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (4001, 141, 1001, 0.001);

/* Goulash with potato */
/* Pork, 500g */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (4002, 501, 1001, 0.500);
/* Potato, 1kg */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (4002, 1, 1001, 1.0);
/* White salad leek, 400g */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (4002, 11, 1001, 0.400);
/* Wheat flour */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (4002, 1001, 1001, 0.015);
/* Bay leaf, 1g */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (4002, 141, 1001, 0.001);
/* Tomato paste, 80g */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (4002, 305, 1001, 0.080);
/* Refined sunflower oil, 0.1l */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (4002, 301, 4006, 0.100);

/* Beer "Doms", 0.5l bottle */
INSERT INTO course_ingredient
       (course_id, ingredient_id, portion_id, amount)
VALUES (10001, 10001, 4003, 1.0);

/*==============================================================*/
/* Index: course_ingredient_PK                                  */
/*==============================================================*/
create unique index course_ingredient_PK on course_ingredient (
ingredient_id,
course_id
);

/*==============================================================*/
/* Index: crs_ingrd_portion_FK                                  */
/*==============================================================*/
create  index crs_ingrd_portion_FK on course_ingredient (
portion_id
);

/*==============================================================*/
/* Index: crs_ingrd_ingredient_FK                               */
/*==============================================================*/
create  index crs_ingrd_ingredient_FK on course_ingredient (
ingredient_id
);

/*==============================================================*/
/* Index: crs_ingrd_course_FK                                   */
/*==============================================================*/
create  index crs_ingrd_course_FK on course_ingredient (
course_id
);

/*==============================================================*/
/* Table: employee                                              */
/*==============================================================*/
create table employee (
   employee_id          SERIAL               not null,
   job_position_id      INT4                 not null,
   first_name           VARCHAR(256)         not null,
   second_name          VARCHAR(256)         not null,
   phone_number         VARCHAR(100)         null,
   salary               FLOAT8               null,
   photo                BYTEA                null,
   dtype                VARCHAR(512)         null,
   constraint PK_EMPLOYEE primary key (employee_id)
);

INSERT INTO employee
       (employee_id, job_position_id, first_name, second_name, dtype)
VALUES (1, 1, 'Yevhen', 'Khomiak', 'Employee');
INSERT INTO employee
       (employee_id, job_position_id, first_name, second_name, dtype)
VALUES (2, 2, 'Ihor', 'Kvilinskyi', 'Employee');
INSERT INTO employee
       (employee_id, job_position_id, first_name, second_name, dtype)
VALUES (3, 4, 'Mariia', 'Khomiak', 'Employee');


ALTER SEQUENCE employee_employee_id_seq RESTART WITH 4;

/*==============================================================*/
/* Index: employee_PK                                           */
/*==============================================================*/
create unique index employee_PK on employee (
employee_id
);

/*==============================================================*/
/* Index: employee_job_position_FK                              */
/*==============================================================*/
create  index employee_job_position_FK on employee (
job_position_id
);

/*==============================================================*/
/* Table: ingredient                                            */
/*==============================================================*/
create table ingredient (
   ingredient_id        SERIAL               not null,
   name                 VARCHAR(256)         not null,
   constraint PK_INGREDIENT primary key (ingredient_id),
   constraint AK_U_INGREDIENT_INGREDIE unique (name)
);

INSERT INTO ingredient
       (ingredient_id, name)
VALUES (1, 'Potato');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (2, 'Onion');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (3, 'Carrot');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (4, 'Vegetable marrow');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (5, 'Tomato');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (6, 'Cucumber');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (7, 'White cabbage');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (8, 'Red cabbage');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (9, 'Pe-tsai');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (10, 'Champignon');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (11, 'White salad leek');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (12, 'Red salad leek');
/* Áîëãàðñüêèé ïåðåöü */
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (13, 'Capsicum');

INSERT INTO ingredient
       (ingredient_id, name)
VALUES (101, 'Salt');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (111, 'Sugar');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (121, 'Black pepper');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (122, 'Red pepper');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (123, 'Paprika');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (131, 'Cinnamon');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (141, 'Bay leaf');

INSERT INTO ingredient
       (ingredient_id, name)
VALUES (201, 'Butter');

INSERT INTO ingredient
       (ingredient_id, name)
VALUES (301, 'Refined sunflower oil');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (302, 'Sunflower oil');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (303, 'Olive oil');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (304, 'Vinegar');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (305, 'Tomato paste');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (306, 'Grape vinegar');

INSERT INTO ingredient
       (ingredient_id, name)
VALUES (401, 'Chicken fillet');

INSERT INTO ingredient
       (ingredient_id, name)
VALUES (501, 'Pork');

/* Brynza */
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (601, 'Sheep cheese');

INSERT INTO ingredient
       (ingredient_id, name)
VALUES (1001, 'Wheat flour');

/* --------------------------------------------------------------- */
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (10001, 'Beer "Doms"');

/* --------------------------------------------------------------- */
ALTER SEQUENCE ingredient_ingredient_id_seq RESTART WITH 20001;

/*==============================================================*/
/* Index: ingredient_PK                                         */
/*==============================================================*/
create unique index ingredient_PK on ingredient (
ingredient_id
);

/*==============================================================*/
/* Table: job_position_dic                                      */
/*==============================================================*/
create table job_position_dic (
   job_position_id      SERIAL               not null,
   name                 VARCHAR(256)         not null,
   constraint PK_JOB_POSITION_DIC primary key (job_position_id),
   constraint AK_U_POSITION_NAME_JOB_POSI unique (name)
);

INSERT INTO job_position_dic
       (job_position_id, name)
VALUES (1, 'Manager');
INSERT INTO job_position_dic
       (job_position_id, name)
VALUES (2, 'Chef');
INSERT INTO job_position_dic
       (job_position_id, name)
VALUES (3, 'Cook');
INSERT INTO job_position_dic
       (job_position_id, name)
VALUES (4, 'Waiter');
INSERT INTO job_position_dic
       (job_position_id, name)
VALUES (5, 'Cleaner');


ALTER SEQUENCE job_position_dic_job_position_id_seq RESTART WITH 6;


/*==============================================================*/
/* Index: job_position_dic_PK                                   */
/*==============================================================*/
create unique index job_position_dic_PK on job_position_dic (
job_position_id
);

/*==============================================================*/
/* Table: measuring_type_dic                                    */
/*==============================================================*/
create table measuring_type_dic (
   measuring_type_id    SERIAL               not null,
   measuring_type_code  CHAR(3)              not null,
   name                 VARCHAR(256)         not null,
   constraint PK_MEASURING_TYPE_DIC primary key (measuring_type_id),
   constraint AK_U_MEASURING_CODE_MEASURIN unique (measuring_type_code),
   constraint AK_U_MEASURING_NAME_MEASURIN unique (name)
);

INSERT INTO measuring_type_dic
       (measuring_type_id, measuring_type_code, name)
VALUES (1, 'kg', 'kilogram');           
INSERT INTO measuring_type_dic
       (measuring_type_id, measuring_type_code, name)
VALUES (2, 'l', 'litre');


ALTER SEQUENCE measuring_type_dic_measuring_type_id_seq RESTART WITH 3;

/*==============================================================*/
/* Index: measuring_type_dic_PK                                 */
/*==============================================================*/
create unique index measuring_type_dic_PK on measuring_type_dic (
measuring_type_id
);

/*==============================================================*/
/* Table: menu                                                  */
/*==============================================================*/
create table menu (
   menu_id              SERIAL               not null,
   name                 VARCHAR(256)         not null,
   constraint PK_MENU primary key (menu_id),
   constraint AK_U_MENU_MENU unique (name)
);

INSERT INTO menu
       (menu_id, name)
VALUES (1, 'Our first very simple trial menu');
INSERT INTO menu
       (menu_id, name)
VALUES (2, 'Our second simple menu');

/* ------------------------------------------------------------- */
ALTER SEQUENCE menu_menu_id_seq RESTART WITH 101;


/*==============================================================*/
/* Index: menu_PK                                               */
/*==============================================================*/
create unique index menu_PK on menu (
menu_id
);

/*==============================================================*/
/* Table: menu_course                                           */
/*==============================================================*/
create table menu_course (
   course_id            INT4                 not null,
   menu_id              INT4                 not null,
   constraint PK_MENU_COURSE primary key (course_id, menu_id)
);

/* Our first very simple trial menu */
/* Shopska salad */
INSERT INTO menu_course
       (course_id, menu_id)
VALUES (2001, 1);
/* Chicken with mushrooms, cooked by Ihor Kvilinskyi's recipe */
INSERT INTO menu_course
       (course_id, menu_id)
VALUES (4001, 1);
/* Beer "Doms", 0.5l bottle */
INSERT INTO menu_course
       (course_id, menu_id)
VALUES (10001, 1);

/* Our second simple menu */
/* Goulash with potato */
INSERT INTO menu_course
       (course_id, menu_id)
VALUES (4002, 2);
/* Beer "Doms", 0.5l bottle */
INSERT INTO menu_course
       (course_id, menu_id)
VALUES (10001, 2);

/*==============================================================*/
/* Index: menu_course_PK                                        */
/*==============================================================*/
create unique index menu_course_PK on menu_course (
course_id,
menu_id
);

/*==============================================================*/
/* Index: menu_course_FK                                        */
/*==============================================================*/
create  index menu_course_FK on menu_course (
course_id
);

/*==============================================================*/
/* Index: menu_course2_FK                                       */
/*==============================================================*/
create  index menu_course2_FK on menu_course (
menu_id
);

/*==============================================================*/
/* Table: "order"                                               */
/*==============================================================*/
create table "order" (
   order_id             SERIAL               not null,
   table_id             INT4                 not null,
   state_type           CHAR(1)              not null,
   employee_id          INT4                 not null,
   order_number         VARCHAR(100)         not null,
   order_datetime       TIMESTAMP            not null default CURRENT_TIMESTAMP,
   constraint PK_ORDER primary key (order_id)
);

/*==============================================================*/
/* Index: order_PK                                              */
/*==============================================================*/
create unique index order_PK on "order" (
order_id
);

/*==============================================================*/
/* Index: order_employee_FK                                     */
/*==============================================================*/
create  index order_employee_FK on "order" (
employee_id
);

/*==============================================================*/
/* Index: order_table_FK                                        */
/*==============================================================*/
create  index order_table_FK on "order" (
table_id
);

/*==============================================================*/
/* Index: order_state_FK                                        */
/*==============================================================*/
create  index order_state_FK on "order" (
state_type
);

/*==============================================================*/
/* Index: order_datetime_idx                                    */
/*==============================================================*/
create  index order_datetime_idx on "order" (
order_datetime
);

/*==============================================================*/
/* Table: order_course                                          */
/*==============================================================*/
create table order_course (
   order_id             INT4                 not null,
   course_id            INT4                 not null
);

/*==============================================================*/
/* Index: order_course_FK                                       */
/*==============================================================*/
create  index order_course_FK on order_course (
order_id
);

/*==============================================================*/
/* Index: order_course2_FK                                      */
/*==============================================================*/
create  index order_course2_FK on order_course (
course_id
);

/*==============================================================*/
/* Table: portion_dic                                           */
/*==============================================================*/
create table portion_dic (
   portion_id           SERIAL               not null,
   portion_type_id      INT4                 not null,
   measuring_type_id    INT4                 not null,
   amount               FLOAT8               null,
   description          VARCHAR(256)         not null,
   constraint PK_PORTION_DIC primary key (portion_id),
   constraint AK_AK_PORTION_U_PORTION_ unique (description)
);

INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (1001, 1, 1, null, 'kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (1002, 1, 2, null, 'litre');

INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2001, 2, 1, 0.25, 'Packing 0,25kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2002, 2, 1, 0.5, 'Packing 0,5kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2003, 2, 1, 0.75, 'Packing 0,75kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2004, 2, 1, 1.0, 'Packing 1kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2005, 2, 1, 1.5, 'Packing 1,5kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2006, 2, 1, 2.0, 'Packing 2kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2007, 2, 1, 3.0, 'Packing 3kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2008, 2, 1, 0.005, 'Packing 5g');

INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3001, 3, 1, 0.25, 'Can 0,25kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3002, 3, 1, 0.33, 'Can 0,33kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3003, 3, 1, 0.5, 'Can 0,5kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3004, 3, 1, 1.0, 'Can 1kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3005, 3, 1, 1.5, 'Can 1,5kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3006, 3, 1, 2.0, 'Can 2kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3007, 3, 1, 3.0, 'Can 3kg');

INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3101, 3, 2, 0.25, 'Can 0,25l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3102, 3, 2, 0.33, 'Can 0,33l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3103, 3, 2, 0.5, 'Can 0,5l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3104, 3, 2, 1.0, 'Can 1l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3105, 3, 2, 1.5, 'Can 1,5l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3106, 3, 2, 2.0, 'Can 2l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3107, 3, 2, 3.0, 'Can 3l');

INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4001, 4, 2, 0.25, 'Bottle 0,25l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4002, 4, 2, 0.33, 'Bottle 0,33l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4003, 4, 2, 0.5, 'Bottle 0,5l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4004, 4, 2, 0.6, 'Bottle 0,6l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4005, 4, 2, 0.75, 'Bottle 0,75l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4006, 4, 2, 1.0, 'Bottle 1l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4007, 4, 2, 1.5, 'Bottle 1,5l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4008, 4, 2, 1.75, 'Bottle 1,75l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4009, 4, 2, 2.0, 'Bottle 2l');

/*==============================================================*/
/* Index: portion_dic_PK                                        */
/*==============================================================*/
create unique index portion_dic_PK on portion_dic (
portion_id
);

/*==============================================================*/
/* Index: portion_type_FK                                       */
/*==============================================================*/
create  index portion_type_FK on portion_dic (
portion_type_id
);

/*==============================================================*/
/* Index: portion_measury_FK                                    */
/*==============================================================*/
create  index portion_measury_FK on portion_dic (
measuring_type_id
);

/*==============================================================*/
/* Table: portion_type_dic                                      */
/*==============================================================*/
create table portion_type_dic (
   portion_type_id      SERIAL               not null,
   name                 VARCHAR(256)         not null,
   constraint PK_PORTION_TYPE_DIC primary key (portion_type_id),
   constraint AK_U_PORTION_NAME_PORTION_ unique (name)
);

INSERT INTO portion_type_dic
       (portion_type_id, name)
VALUES (1, 'Portion (anything)'); 
INSERT INTO portion_type_dic
       (portion_type_id, name)
VALUES (2, 'Packing');      
INSERT INTO portion_type_dic
       (portion_type_id, name)
VALUES (3, 'Can'); 
INSERT INTO portion_type_dic
       (portion_type_id, name)
VALUES (4, 'Bottle');     

ALTER SEQUENCE portion_dic_portion_id_seq RESTART WITH 5;




/*==============================================================*/
/* Index: portion_type_dic_PK                                   */
/*==============================================================*/
create unique index portion_type_dic_PK on portion_type_dic (
portion_type_id
);

/*==============================================================*/
/* Table: state_dic                                             */
/*==============================================================*/
create table state_dic (
   state_type           CHAR(1)              not null,
   name                 VARCHAR(256)         not null,
   constraint PK_STATE_DIC primary key (state_type)
);

INSERT INTO state_dic 
       (state_type, name)
VALUES ('A', 'Open');
INSERT INTO state_dic 
       (state_type, name)
VALUES ('B', 'Closed');
INSERT INTO state_dic 
       (state_type, name)
VALUES ('C', 'Removed');
            

/*==============================================================*/
/* Index: state_dic_PK                                          */
/*==============================================================*/
create unique index state_dic_PK on state_dic (
state_type
);

/*==============================================================*/
/* Table: state_graph                                           */
/*==============================================================*/
create table state_graph (
   init_state_type      CHAR(1)              not null,
   finite_state_type    CHAR(1)              not null,
   action_type          CHAR(1)              not null,
   entity_name          VARCHAR(256)         not null,
   comment              VARCHAR(256)         null,
   constraint PK_STATE_GRAPH primary key (init_state_type, finite_state_type, action_type, entity_name)
);

INSERT INTO state_graph
       (init_state_type, finite_state_type, action_type, entity_name, comment)
VALUES ('A', 'A', 'A', 'order', 'Order creation');
INSERT INTO state_graph
       (init_state_type, finite_state_type, action_type, entity_name, comment)
VALUES ('A', 'C', 'B', 'order', 'Open order removal');
INSERT INTO state_graph
       (init_state_type, finite_state_type, action_type, entity_name, comment)
VALUES ('A', 'B', 'D', 'order', 'Order closing');
INSERT INTO state_graph
       (init_state_type, finite_state_type, action_type, entity_name, comment)
VALUES ('A', 'A', 'C', 'order', 'Open order filling');
INSERT INTO state_graph
       (init_state_type, finite_state_type, action_type, entity_name, comment)
VALUES ('A', 'A', 'E', 'order', 'Open order viewing');
INSERT INTO state_graph
       (init_state_type, finite_state_type, action_type, entity_name, comment)
VALUES ('B', 'B', 'E', 'order', 'Closed order viewing');

/*==============================================================*/
/* Index: state_graph_PK                                        */
/*==============================================================*/
create unique index state_graph_PK on state_graph (
init_state_type,
finite_state_type,
action_type,
entity_name
);

/*==============================================================*/
/* Index: init_state_FK                                         */
/*==============================================================*/
create  index init_state_FK on state_graph (
init_state_type
);

/*==============================================================*/
/* Index: finite_state_FK                                       */
/*==============================================================*/
create  index finite_state_FK on state_graph (
finite_state_type
);

/*==============================================================*/
/* Index: action_state_FK                                       */
/*==============================================================*/
create  index action_state_FK on state_graph (
action_type
);

/*==============================================================*/
/* Table: "table"                                               */
/*==============================================================*/
create table "table" (
   table_id             SERIAL               not null,
   number               INT4                 not null,
   description          VARCHAR(256)         null,
   constraint PK_TABLE primary key (table_id),
   constraint AK_U_TABLE_NUMBER_TABLE unique (number)
);


INSERT INTO "table"
       (table_id, number, description)
VALUES (1, 1, 'Counter');
INSERT INTO "table"
       (table_id, number)
VALUES (2, 2);
INSERT INTO "table"
       (table_id, number)
VALUES (3, 3);
INSERT INTO "table"
       (table_id, number)
VALUES (4, 4);
INSERT INTO "table"
       (table_id, number)
VALUES (5, 5);
INSERT INTO "table"
       (table_id, number)
VALUES (6, 6);
INSERT INTO "table"
       (table_id, number)
VALUES (7, 7);
INSERT INTO "table"
       (table_id, number)
VALUES (8, 8);

ALTER SEQUENCE table_table_id_seq RESTART WITH 9;


/*==============================================================*/
/* Index: table_PK                                              */
/*==============================================================*/
create unique index table_PK on "table" (
table_id
);

/*==============================================================*/
/* Table: warehouse                                             */
/*==============================================================*/
create table warehouse (
   ingredient_id        INT4                 not null,
   portion_id           INT4                 not null,
   amount               FLOAT8               not null,
   constraint PK_WAREHOUSE primary key (ingredient_id, portion_id)
);

/* Champignon mushroom, measurable in kilos */
INSERT INTO warehouse
       (ingredient_id, portion_id, amount)
VALUES (10, 1001, 500.0);

/* Salt, measurable in 0.5gk packing */
INSERT INTO warehouse
       (ingredient_id, portion_id, amount)
VALUES (101, 2002, 300.0);

/* Sugar, measurable in 0.5gk packing */
INSERT INTO warehouse
       (ingredient_id, portion_id, amount)
VALUES (111, 2002, 300.0);

/* Refined sunflower oil, measurable in 1l bottle */
INSERT INTO warehouse
       (ingredient_id, portion_id, amount)
VALUES (301, 4006, 700.0);

/* Chicken fillet, measurable in kilos */
INSERT INTO warehouse
       (ingredient_id, portion_id, amount)
VALUES (401, 1001, 50.0);

/* Pork, measurable in kilos */
INSERT INTO warehouse
       (ingredient_id, portion_id, amount)
VALUES (501, 1001, 100.0);

/* Bay leaf, measurable in 5g packing */
INSERT INTO warehouse
       (ingredient_id, portion_id, amount)
VALUES (141, 2008, 3000.0);

/* Beer "Doms", measurable in 0.5l bottle */
INSERT INTO warehouse
       (ingredient_id, portion_id, amount)
VALUES (10001, 4003, 1000.0);

/*==============================================================*/
/* Index: wrhs_portion_FK                                       */
/*==============================================================*/
create  index wrhs_portion_FK on warehouse (
portion_id
);

/*==============================================================*/
/* View: v_employee                                             */
/*==============================================================*/
create or replace view v_employee as
SELECT employee.employee_id      AS employee_id,
       employee.job_position_id  AS job_position_id,
       employee.first_name       AS first_name,
       employee.second_name      AS second_name,
       employee.phone_number     AS phone_number,
       employee.salary           AS salary,
       job_position_dic.name     AS job_position_name
  FROM employee, job_position_dic
 WHERE (job_position_dic.job_position_id = employee.job_position_id);

/*==============================================================*/
/* View: v_cook                                                 */
/*==============================================================*/
create or replace view v_cook as
SELECT v_employee.employee_id        AS employee_id,
       v_employee.job_position_id    AS job_position_id,
       v_employee.first_name         AS first_name,
       v_employee.second_name        AS second_name,
       v_employee.phone_number       AS phone_number,
       v_employee.salary             AS salary,
       v_employee.job_position_name  AS job_position_name
  FROM v_employee
 WHERE EXISTS(SELECT * FROM cooked_course
               WHERE (cooked_course.employee_id = v_employee.employee_id));

/*==============================================================*/
/* View: v_cooked_course                                        */
/*==============================================================*/
create or replace view v_cooked_course as
SELECT cooked_course.cooked_course_id,
       cooked_course.course_id,
       cooked_course.employee_id,
       cooked_course.cook_datetime,
       cooked_course.weight AS cook_weight, 
       course.course_category_id,
       course.name AS course_name,
       course.weight AS course_weight,
       course.cost AS course_cost,
       employee.job_position_id AS employee_job_position_id,
       employee.first_name AS employee_first_name,
       employee.second_name AS employee_second_name, 
       employee.phone_number AS employee_phone_number,
       employee.salary AS employee_salary
  FROM cooked_course, 
       course, 
       employee
 WHERE (course.course_id = cooked_course.course_id)
   AND (employee.employee_id = cooked_course.employee_id);

/*==============================================================*/
/* View: v_course                                               */
/*==============================================================*/
create or replace view v_course as
SELECT course.course_id                  AS course_id,
       course.course_category_id         AS course_category_id,
       course.name                       AS name,
       course.weight                     AS weight,
       course.cost                       AS cost,
       course_category_dic.name          AS course_category_name
  FROM course,
       course_category_dic
 WHERE (course_category_dic.course_category_id = course.course_category_id);

/*==============================================================*/
/* View: v_menu_courses_list                                    */
/*==============================================================*/
create or replace view v_menu_courses_list as
select
   menu.name as menu_name,
   v_course.course_category_id as course_category_id,
   v_course.name as course_name,
   v_course.weight as course_weight,
   v_course.cost as course_cost,
   v_course.course_category_name as course_category_name
from
   menu,
   v_course;

/*==============================================================*/
/* View: v_order                                                */
/*==============================================================*/
create or replace view v_order as
SELECT "order".order_id                 AS order_id,
       "order".table_id                 AS table_id,
       "order".state_type               AS state_type,
       "order".employee_id              AS employee_id,
       "order".order_number             AS order_number,
       "order".order_datetime           AS order_datetime,
       state_dic.name                   AS state_type_name,
       v_employee.job_position_id       AS employee_job_position_id,
       v_employee.first_name            AS employee_first_name,
       v_employee.second_name           AS employee_second_name,
       v_employee.phone_number          AS employee_phone_number,
       v_employee.salary                AS employee_salary,
       v_employee.job_position_name     AS employee_job_position_name,
       "table".number                   AS table_number,
       "table".description              AS table_description
  FROM "order", state_dic, v_employee, "table"
 WHERE (state_dic.state_type = "order".state_type)  
   AND (v_employee.employee_id = "order".employee_id)
   AND ("table".table_id = "order".table_id);

/*==============================================================*/
/* View: v_order_course                                         */
/*==============================================================*/
create or replace view v_order_course as
SELECT   
   order_course.order_id as order_id,
   order_course.course_id as course_id,
   v_order.table_id as table_id,
   v_order.state_type as order_state_type,
   v_order.employee_id as employee_id,
   v_order.order_number as order_number,
   v_order.order_datetime as order_datetime,
   v_order.state_type_name as order_state_type_name,
   v_course.course_category_id as course_category_id,
   v_course.name as course_name,
   v_course.weight as course_weight,
   v_course.cost as course_cost,
   v_course.course_category_name as course_category_name
FROM
   order_course,
   v_order,
   v_course
WHERE
   (v_order.order_id = order_course.order_id)
   AND ( v_course.course_id = order_course.course_id);

/*==============================================================*/
/* View: v_portion_dic                                          */
/*==============================================================*/
create or replace view v_portion_dic as
SELECT portion_dic.portion_id                   AS portion_id,
       portion_dic.portion_type_id              AS portion_type_id,
       portion_dic.measuring_type_id            AS measuring_type_id,
       portion_dic.amount                       AS amount,
       portion_dic.description                  AS description,
       portion_type_dic.name                    AS portion_type_name,
       measuring_type_dic.measuring_type_code   AS measuring_type_code,
       measuring_type_dic.name                  AS measuring_type_name 

  FROM portion_dic,
       portion_type_dic,
       measuring_type_dic
 WHERE (portion_type_dic.portion_type_id = portion_dic.portion_type_id)
   AND (measuring_type_dic.measuring_type_id = portion_dic.measuring_type_id);

/*==============================================================*/
/* View: v_waiter                                               */
/*==============================================================*/
create or replace view v_waiter as
SELECT v_employee.employee_id        AS employee_id,
       v_employee.job_position_id    AS job_position_id,
       v_employee.first_name         AS first_name,
       v_employee.second_name        AS second_name,
       v_employee.phone_number       AS phone_number,
       v_employee.salary             AS salary,
       v_employee.job_position_name  AS job_position_name
  FROM v_employee
 WHERE EXISTS(SELECT * FROM "order"
               WHERE ("order".employee_id = v_employee.employee_id));

/*==============================================================*/
/* View: v_warehouse                                            */
/*==============================================================*/
create or replace view v_warehouse as
SELECT warehouse.ingredient_id                  AS ingredient_id,
       warehouse.portion_id                     AS portion_id,
       warehouse.amount                         AS amount,
       ingredient.name                          AS ingredient_name,
       v_portion_dic.portion_type_id            AS portion_type_id,
       v_portion_dic.measuring_type_id          AS measuring_type_id,
       v_portion_dic.amount                     AS portion_amount,
       v_portion_dic.description                AS portion_description,
       v_portion_dic.portion_type_name          AS portion_type_name,
       v_portion_dic.measuring_type_code        AS measuring_type_code,
       v_portion_dic.measuring_type_name        AS measuring_type_name 

  FROM warehouse,
       ingredient,
       v_portion_dic
 WHERE (ingredient.ingredient_id = warehouse.ingredient_id)
   AND (v_portion_dic.portion_id = warehouse.portion_id);

alter table cooked_course
   add constraint FK_COOKED_C_CKD_CRS_C_COURSE foreign key (course_id)
      references course (course_id)
      on delete cascade on update restrict;

alter table cooked_course
   add constraint FK_COOKED_C_CKD_CRS_E_EMPLOYEE foreign key (employee_id)
      references employee (employee_id)
      on delete restrict on update restrict;

alter table course
   add constraint FK_COURSE_COURSE_CA_COURSE_C foreign key (course_category_id)
      references course_category_dic (course_category_id)
      on delete restrict on update restrict;

alter table course_ingredient
   add constraint FK_COURSE_I_CRS_INGRD_COURSE foreign key (course_id)
      references course (course_id)
      on delete cascade on update restrict;

alter table course_ingredient
   add constraint FK_COURSE_I_CRS_INGRD_INGREDIE foreign key (ingredient_id)
      references ingredient (ingredient_id)
      on delete restrict on update restrict;

alter table course_ingredient
   add constraint FK_COURSE_I_CRS_INGRD_PORTION_ foreign key (portion_id)
      references portion_dic (portion_id)
      on delete restrict on update restrict;

alter table employee
   add constraint FK_EMPLOYEE_EMPLOYEE__JOB_POSI foreign key (job_position_id)
      references job_position_dic (job_position_id)
      on delete restrict on update restrict;

alter table menu_course
   add constraint FK_MENU_COU_MMU_CRS_C_COURSE foreign key (course_id)
      references course (course_id)
      on delete restrict on update restrict;

alter table menu_course
   add constraint FK_MENU_COU_MMU_CRS_M_MENU foreign key (menu_id)
      references menu (menu_id)
      on delete cascade on update restrict;

alter table "order"
   add constraint FK_ORDER_ORDER_EMP_EMPLOYEE foreign key (employee_id)
      references employee (employee_id)
      on delete restrict on update restrict;

alter table "order"
   add constraint FK_ORDER_ORDER_STA_STATE_DI foreign key (state_type)
      references state_dic (state_type)
      on delete restrict on update restrict;

alter table "order"
   add constraint FK_ORDER_ORDER_TAB_TABLE foreign key (table_id)
      references "table" (table_id)
      on delete restrict on update restrict;

alter table order_course
   add constraint FK_ORDER_CO_ORD_CRS_C_COURSE foreign key (course_id)
      references course (course_id)
      on delete restrict on update restrict;

alter table order_course
   add constraint FK_ORDER_CO_ORD_CRS_O_ORDER foreign key (order_id)
      references "order" (order_id)
      on delete cascade on update restrict;

alter table portion_dic
   add constraint FK_PORTION__PORTION_M_MEASURIN foreign key (measuring_type_id)
      references measuring_type_dic (measuring_type_id)
      on delete restrict on update restrict;

alter table portion_dic
   add constraint FK_PORTION__PORTION_T_PORTION_ foreign key (portion_type_id)
      references portion_type_dic (portion_type_id)
      on delete restrict on update restrict;

alter table state_graph
   add constraint FK_STATE_GR_ACTION_ST_ACTION_D foreign key (action_type)
      references action_dic (action_type)
      on delete cascade on update restrict;

alter table state_graph
   add constraint FK_STATE_GR_FINITE_ST_STATE_DI foreign key (finite_state_type)
      references state_dic (state_type)
      on delete restrict on update restrict;

alter table state_graph
   add constraint FK_STATE_GR_INIT_STAT_STATE_DI foreign key (init_state_type)
      references state_dic (state_type)
      on delete restrict on update restrict;

alter table warehouse
   add constraint FK_WAREHOUS_WRHS_INGR_INGREDIE foreign key (ingredient_id)
      references ingredient (ingredient_id)
      on delete restrict on update restrict;

alter table warehouse
   add constraint FK_WAREHOUS_WRHS_PORT_PORTION_ foreign key (portion_id)
      references portion_dic (portion_id)
      on delete restrict on update restrict;

