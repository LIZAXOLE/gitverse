BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Materials" (
	"id"	INTEGER,
	"name"	TEXT,
	"type"	TEXT
);
CREATE TABLE IF NOT EXISTS "Orders" (
	"id"	INTEGER,
	"customer_id"	TEXT,
	"order_date"	TEXT,
	"status"	TEXT,
	FOREIGN KEY("customer_id") REFERENCES "Customers"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Order_items" (
	"id"	INTEGER,
	"order_id"	INTEGER,
	"product_id"	INTEGER,
	"quantity"	INTEGER,
	FOREIGN KEY("product_id") REFERENCES "Products"("id"),
	FOREIGN KEY("order_id") REFERENCES "Orders"("id"),
	PRIMARY KEY("order_id","product_id")
);
CREATE TABLE IF NOT EXISTS "Specification" (
	"id"	INTEGER,
	"product_id"	INTEGER,
	"material_id"	INTEGER,
	"qty"	REAL,
	PRIMARY KEY("id"),
	FOREIGN KEY("product_id") REFERENCES "Products"("id"),
	FOREIGN KEY("material_id") REFERENCES "Materials"("id")
);
CREATE TABLE IF NOT EXISTS "Sales" (
	"id"	INTEGER,
	"product_id"	INTEGER,
	"material_id"	INTEGER,
	"discount_percent"	REAL,
	FOREIGN KEY("product_id") REFERENCES "Products"("id"),
	FOREIGN KEY("material_id") REFERENCES "Materials"("id")
);
CREATE TABLE IF NOT EXISTS "Prices" (
	"id"	INTEGER,
	"product_id"	INTEGER,
	"material_id"	INTEGER,
	"price"	REAL,
	PRIMARY KEY("id"),
	FOREIGN KEY("product_id") REFERENCES "Products"("id"),
	FOREIGN KEY("material_id") REFERENCES "Materials"("id")
);
CREATE TABLE IF NOT EXISTS "Customers" (
	"id"	INTEGER,
	"name"	TEXT,
	"inn"	TEXT,
	"addres"	TEXT,
	"phone"	INTEGER,
	"type"	TEXT,
	"user_id"	INTEGER,
	FOREIGN KEY("user_id") REFERENCES "Users"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Users" (
	"id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"login"	TEXT NOT NULL UNIQUE,
	"password"	TEXT NOT NULL,
	"full_name"	TEXT,
	"role"	TEXT,
	"is_locked"	INTEGER NOT NULL DEFAULT 0,
	"attempts"	INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE IF NOT EXISTS "Products" (
	"id"	INTEGER,
	"name"	TEXT,
	"category"	TEXT
);
INSERT INTO "Materials" VALUES (548,'Калибровка','Операция');
INSERT INTO "Materials" VALUES (15,'Петля мебельная 4-х точечная','Материал');
INSERT INTO "Materials" VALUES (834,'Уплотнитель для стекла','Материал');
INSERT INTO "Materials" VALUES (27,'Покраска эмалью','Операция');
INSERT INTO "Materials" VALUES (712,'Амортизатор для крышки стола','Материал');
INSERT INTO "Materials" VALUES (913,'Разгрузка','Операция');
INSERT INTO "Materials" VALUES (8,'Упаковка','Операция');
INSERT INTO "Materials" VALUES (445,'Направляющая шариковая 450мм','Материал');
INSERT INTO "Materials" VALUES (267,'Колесо мебельное с тормозом','Материал');
INSERT INTO "Materials" VALUES (18,'Замок мебельный','Материал');
INSERT INTO "Materials" VALUES (629,'Браширование','Операция');
INSERT INTO "Materials" VALUES (3,'Мебельная деталь 600х800','Материал');
INSERT INTO "Materials" VALUES (791,'Полировка','Операция');
INSERT INTO "Materials" VALUES (584,'Дюбель пластиковый 6х30','Материал');
INSERT INTO "Materials" VALUES (234,'Задняя стенка ДВП 3мм','Материал');
INSERT INTO "Materials" VALUES (11,'МДФ 10мм','Материал');
INSERT INTO "Materials" VALUES (456,'Магнит мебельный','Материал');
INSERT INTO "Materials" VALUES (876,'Фрезеровка пазов','Операция');
INSERT INTO "Materials" VALUES (29,'Обивка мягких элементов','Операция');
INSERT INTO "Materials" VALUES (148,'Цокольные ножки 100мм','Материал');
INSERT INTO "Materials" VALUES (723,'Петля мебельная 2-х точечная','Материал');
INSERT INTO "Materials" VALUES (6,'Распил ДСП, МДФ и листового материала','Операция');
INSERT INTO "Materials" VALUES (362,'Лакировка','Операция');
INSERT INTO "Materials" VALUES (953,'Зеркало 4мм','Материал');
INSERT INTO "Materials" VALUES (21,'Клей ПВА столярный','Материал');
INSERT INTO "Materials" VALUES (668,'Роликовый механизм для дверей','Материал');
INSERT INTO "Materials" VALUES (891,'Кромка меламиновая 0,4мм','Материал');
INSERT INTO "Materials" VALUES (13,'Конфирмат 7х50','Материал');
INSERT INTO "Materials" VALUES (541,'Установка зеркала','Операция');
INSERT INTO "Materials" VALUES (2,'Мебельная деталь 500х800','Материал');
INSERT INTO "Materials" VALUES (815,'Морение','Операция');
INSERT INTO "Materials" VALUES (387,'Труба хромированная 16мм','Материал');
INSERT INTO "Materials" VALUES (25,'Стекло закаленное 4мм','Материал');
INSERT INTO "Materials" VALUES (7,'Сборка модулей','Операция');
INSERT INTO "Materials" VALUES (967,'Ножки мебельные металлические','Материал');
INSERT INTO "Materials" VALUES (473,'Патинирование','Операция');
INSERT INTO "Materials" VALUES (17,'Ручка-скоба 128мм','Материал');
INSERT INTO "Materials" VALUES (762,'Монтаж подсветки','Операция');
INSERT INTO "Materials" VALUES (593,'Планка цокольная','Материал');
INSERT INTO "Materials" VALUES (1,'Евровинт 6,5х5','Материал');
INSERT INTO "Materials" VALUES (934,'Роспись','Операция');
INSERT INTO "Materials" VALUES (273,'Профиль алюминиевый для фасада','Материал');
INSERT INTO "Materials" VALUES (287,'Торцовка кромок','Операция');
INSERT INTO "Materials" VALUES (10,'ДСП 16мм венге','Материал');
INSERT INTO "Materials" VALUES (821,'Финальная проверка','Операция');
INSERT INTO "Materials" VALUES (671,'Поролон стандартный 20мм','Материал');
INSERT INTO "Materials" VALUES (16,'Направляющая шариковая 300мм','Материал');
INSERT INTO "Materials" VALUES (5,'Столешница круглая','Материал');
INSERT INTO "Materials" VALUES (915,'Фланец для трубы','Материал');
INSERT INTO "Materials" VALUES (321,'Механизм трансформации дивана','Материал');
INSERT INTO "Materials" VALUES (22,'Лак акриловый бесцветный','Материал');
INSERT INTO "Materials" VALUES (724,'Штанга для одежды 1200мм','Материал');
INSERT INTO "Materials" VALUES (187,'Установка стекла','Операция');
INSERT INTO "Materials" VALUES (9,'ДСП 16мм белая','Материал');
INSERT INTO "Materials" VALUES (419,'Сверление отверстий','Операция');
INSERT INTO "Materials" VALUES (847,'ДСП 25мм дуб','Материал');
INSERT INTO "Materials" VALUES (24,'Поролон стандартный 40мм','Материал');
INSERT INTO "Materials" VALUES (654,'Присадка фурнитуры','Операция');
INSERT INTO "Materials" VALUES (14,'Саморез 3,5х16','Материал');
INSERT INTO "Materials" VALUES (894,'Обрешетка','Операция');
INSERT INTO "Materials" VALUES (4,'Опора','Материал');
INSERT INTO "Materials" VALUES (542,'Заглушка для трубы','Материал');
INSERT INTO "Materials" VALUES (28,'Нанесение кромки','Операция');
INSERT INTO "Materials" VALUES (776,'Грунт по дереву','Материал');
INSERT INTO "Materials" VALUES (19,'Опора регулируемая 100мм','Материал');
INSERT INTO "Materials" VALUES (923,'Склеивание деталей','Операция');
INSERT INTO "Materials" VALUES (12,'Фанера березовая 10мм','Материал');
INSERT INTO "Materials" VALUES (369,'Термообработка','Операция');
INSERT INTO "Materials" VALUES (20,'Кромка ПВХ 2мм белая','Материал');
INSERT INTO "Materials" VALUES (698,'Логистика до склада','Операция');
INSERT INTO "Materials" VALUES (306,'Полкодержатель металлический','Материал');
INSERT INTO "Materials" VALUES (26,'Шлифовка поверхности','Операция');
INSERT INTO "Materials" VALUES (862,'Лифт для фасада','Материал');
INSERT INTO "Materials" VALUES (178,'Шкант деревянный 8х30','Материал');
INSERT INTO "Materials" VALUES (30,'Контроль качества','Операция');
INSERT INTO "Materials" VALUES (491,'Доводчик для петель','Материал');
INSERT INTO "Materials" VALUES (23,'Ткань велюр "Изумруд"','Материал');
INSERT INTO "Materials" VALUES (739,'Уголок мебельный скрытый','Материал');
INSERT INTO "Materials" VALUES (392,'Фанера березовая 4мм','Материал');
INSERT INTO "Materials" VALUES (502,'Морилка водная "Дуб"','Материал');
INSERT INTO "Materials" VALUES (189,'Щетка-шлегель для шкафа-купе','Материал');
INSERT INTO "Materials" VALUES (561,'Саморез 4х40','Материал');
INSERT INTO "Materials" VALUES (889,'Ткань шенилл "Беж"','Материал');
INSERT INTO "Materials" VALUES (158,'Сетчатая корзина для шкафа','Материал');
INSERT INTO "Materials" VALUES (618,'Кромка ПВХ 2мм венге','Материал');
INSERT INTO "Materials" VALUES (338,'Ткань рогожка "Серая"','Материал');
INSERT INTO "Materials" VALUES (958,'Чистка поверхности','Операция');
INSERT INTO "Materials" VALUES (44,'Экокожа черная','Материал');
INSERT INTO "Materials" VALUES (274,'Погрузка','Операция');
INSERT INTO "Materials" VALUES (127,'Стекло тонированное 4мм','Материал');
INSERT INTO "Materials" VALUES (714,'Сушка','Операция');
INSERT INTO "Materials" VALUES (219,'Синтепон 100 г/кв.м','Материал');
INSERT INTO "Materials" VALUES (147,'Сортировка','Операция');
INSERT INTO "Materials" VALUES (582,'Инвентаризация','Операция');
INSERT INTO "Materials" VALUES (154,'Клей-расплав для кромки','Материал');
INSERT INTO "Materials" VALUES (427,'Маркировка','Операция');
INSERT INTO "Materials" VALUES (673,'Формирование комплекта','Операция');
INSERT INTO "Materials" VALUES (245,'Фотофиксация','Операция');
INSERT INTO "Materials" VALUES (132,'Удаление пыли','Операция');
INSERT INTO "Materials" VALUES (587,'Обработка антисептиком','Операция');
INSERT INTO "Materials" VALUES (456,'Сертификация','Операция');
INSERT INTO "Materials" VALUES (318,'Упаковка в стрейч-пленку','Операция');
INSERT INTO "Materials" VALUES (258,'Декупаж','Операция');
INSERT INTO "Orders" VALUES (1,'2','2026-04-22','В работе');
INSERT INTO "Orders" VALUES (5,'10','2026-04-25','Отгружен');
INSERT INTO "Orders" VALUES (12,'10','2026-04-28','Новый');
INSERT INTO "Orders" VALUES (14,'9','2026-04-28','Отменен');
INSERT INTO "Orders" VALUES (15,'10','2026-04-29','В работе');
INSERT INTO "Orders" VALUES (18,'3','2026-04-30','Отгружен');
INSERT INTO "Orders" VALUES (19,'9','2026-04-30','Новый');
INSERT INTO "Orders" VALUES (21,'2','2026-05-01','Новый');
INSERT INTO "Orders" VALUES (23,'8','2026-05-02','Отменен');
INSERT INTO "Orders" VALUES (24,'8','2026-05-03','Отгружен');
INSERT INTO "Orders" VALUES (26,'9','2026-05-04','Отменен');
INSERT INTO "Orders" VALUES (27,'9','2026-05-04','Отменен');
INSERT INTO "Orders" VALUES (29,'10','2026-05-05','В работе');
INSERT INTO "Orders" VALUES (33,'9','2026-05-07','Новый');
INSERT INTO "Orders" VALUES (34,'3','2026-05-08','В работе');
INSERT INTO "Orders" VALUES (36,'3','2026-05-08','Отменен');
INSERT INTO "Orders" VALUES (38,'1','2026-05-09','Новый');
INSERT INTO "Orders" VALUES (39,'2','2026-05-10','Отгружен');
INSERT INTO "Orders" VALUES (41,'3','2026-05-11','Отменен');
INSERT INTO "Orders" VALUES (43,'9','2026-05-13','Новый');
INSERT INTO "Orders" VALUES (44,'2','2026-05-14','Новый');
INSERT INTO "Orders" VALUES (47,'8','2026-05-15','Отгружен');
INSERT INTO "Orders" VALUES (48,'2','2026-05-16','Отгружен');
INSERT INTO "Orders" VALUES (52,'8','2026-05-18','Отгружен');
INSERT INTO "Orders" VALUES (55,'8','2026-05-18','В работе');
INSERT INTO "Orders" VALUES (56,'9','2026-05-19','Отменен');
INSERT INTO "Orders" VALUES (59,'2','2026-05-20','В работе');
INSERT INTO "Orders" VALUES (62,'1','2026-05-21','В работе');
INSERT INTO "Orders" VALUES (64,'1','2026-05-22','Новый');
INSERT INTO "Orders" VALUES (67,'8','2026-05-22','Новый');
INSERT INTO "Orders" VALUES (69,'1','2026-05-23','В работе');
INSERT INTO "Orders" VALUES (71,'10','2026-05-24','В работе');
INSERT INTO "Orders" VALUES (73,'8','2026-05-25','В работе');
INSERT INTO "Orders" VALUES (76,'1','2026-05-27','Новый');
INSERT INTO "Orders" VALUES (77,'1','2026-05-28','Отгружен');
INSERT INTO "Orders" VALUES (78,'9','2026-05-29','Отгружен');
INSERT INTO "Orders" VALUES (82,'2','2026-05-30','Отгружен');
INSERT INTO "Orders" VALUES (84,'2','2026-06-01','Новый');
INSERT INTO "Orders" VALUES (87,'3','2026-06-02','Отменен');
INSERT INTO "Orders" VALUES (88,'10','2026-06-03','В работе');
INSERT INTO "Orders" VALUES (89,'2','2026-06-03','В работе');
INSERT INTO "Orders" VALUES (91,'1','2026-06-05','В работе');
INSERT INTO "Orders" VALUES (94,'1','2026-06-07','В работе');
INSERT INTO "Orders" VALUES (96,'9','2026-06-08','Новый');
INSERT INTO "Orders" VALUES (98,'10','2026-06-09','В работе');
INSERT INTO "Orders" VALUES (102,'3','2026-06-10','В работе');
INSERT INTO "Orders" VALUES (104,'10','2026-06-10','В работе');
INSERT INTO "Orders" VALUES (108,'3','2026-06-11','Отменен');
INSERT INTO "Orders" VALUES (112,'2','2026-06-12','В работе');
INSERT INTO "Orders" VALUES (115,'9','2026-06-12','Отгружен');
INSERT INTO "Orders" VALUES (117,'8','2026-06-13','В работе');
INSERT INTO "Orders" VALUES (119,'8','2026-06-13','В работе');
INSERT INTO "Orders" VALUES (126,'10','2026-06-14','Отгружен');
INSERT INTO "Orders" VALUES (128,'2','2026-06-14','Отгружен');
INSERT INTO "Orders" VALUES (134,'3','2026-06-15','Отгружен');
INSERT INTO "Orders" VALUES (137,'10','2026-06-16','В работе');
INSERT INTO "Orders" VALUES (142,'3','2026-06-16','Отгружен');
INSERT INTO "Orders" VALUES (143,'9','2026-06-15','Отменен');
INSERT INTO "Orders" VALUES (147,'8','2026-06-16','Отгружен');
INSERT INTO "Orders" VALUES (149,'2','2026-06-17','Новый');
INSERT INTO "Orders" VALUES (154,'10','2026-06-18','Новый');
INSERT INTO "Orders" VALUES (156,'1','2026-06-18','Новый');
INSERT INTO "Orders" VALUES (161,'8','2026-06-19','Отгружен');
INSERT INTO "Orders" VALUES (167,'1','2026-06-20','В работе');
INSERT INTO "Orders" VALUES (168,'3','2026-06-20','Отменен');
INSERT INTO "Orders" VALUES (172,'10','2026-06-21','В работе');
INSERT INTO "Orders" VALUES (175,'2','2026-06-21','Новый');
INSERT INTO "Orders" VALUES (181,'8','2026-06-22','Новый');
INSERT INTO "Orders" VALUES (189,'3','2026-06-22','Отгружен');
INSERT INTO "Orders" VALUES (193,'1','2026-06-23','Новый');
INSERT INTO "Order_items" VALUES (1,1,1,2);
INSERT INTO "Order_items" VALUES (8,5,1,5);
INSERT INTO "Order_items" VALUES (15,12,83,1);
INSERT INTO "Order_items" VALUES (18,14,398,1);
INSERT INTO "Order_items" VALUES (19,15,83,1);
INSERT INTO "Order_items" VALUES (22,18,20,2);
INSERT INTO "Order_items" VALUES (23,19,398,2);
INSERT INTO "Order_items" VALUES (24,21,12,2);
INSERT INTO "Order_items" VALUES (27,23,306,1);
INSERT INTO "Order_items" VALUES (28,24,398,1);
INSERT INTO "Order_items" VALUES (31,26,306,4);
INSERT INTO "Order_items" VALUES (31,27,69,3);
INSERT INTO "Order_items" VALUES (33,29,942,3);
INSERT INTO "Order_items" VALUES (36,33,306,3);
INSERT INTO "Order_items" VALUES (38,34,881,2);
INSERT INTO "Order_items" VALUES (39,36,20,3);
INSERT INTO "Order_items" VALUES (41,38,942,1);
INSERT INTO "Order_items" VALUES (42,39,12,1);
INSERT INTO "Order_items" VALUES (44,41,12,2);
INSERT INTO "Order_items" VALUES (46,43,69,1);
INSERT INTO "Order_items" VALUES (47,44,20,1);
INSERT INTO "Order_items" VALUES (48,47,69,3);
INSERT INTO "Order_items" VALUES (51,48,881,1);
INSERT INTO "Order_items" VALUES (56,52,398,1);
INSERT INTO "Order_items" VALUES (58,55,69,2);
INSERT INTO "Order_items" VALUES (59,56,398,1);
INSERT INTO "Order_items" VALUES (62,59,20,2);
INSERT INTO "Order_items" VALUES (66,62,83,2);
INSERT INTO "Order_items" VALUES (68,64,83,2);
INSERT INTO "Order_items" VALUES (71,67,69,2);
INSERT INTO "Order_items" VALUES (73,69,942,1);
INSERT INTO "Order_items" VALUES (74,71,942,1);
INSERT INTO "Order_items" VALUES (76,73,306,2);
INSERT INTO "Order_items" VALUES (79,76,1,2);
INSERT INTO "Order_items" VALUES (81,77,942,3);
INSERT INTO "Order_items" VALUES (81,78,398,1);
INSERT INTO "Order_items" VALUES (86,82,12,4);
INSERT INTO "Order_items" VALUES (87,84,881,2);
INSERT INTO "Order_items" VALUES (91,87,20,1);
INSERT INTO "Order_items" VALUES (93,88,942,2);
INSERT INTO "Order_items" VALUES (92,89,20,2);
INSERT INTO "Order_items" VALUES (95,91,83,1);
INSERT INTO "Order_items" VALUES (98,94,1,3);
INSERT INTO "Order_items" VALUES (101,96,69,4);
INSERT INTO "Order_items" VALUES (103,98,83,2);
INSERT INTO "Order_items" VALUES (107,102,881,2);
INSERT INTO "Order_items" VALUES (109,104,1,3);
INSERT INTO "Order_items" VALUES (113,108,881,3);
INSERT INTO "Order_items" VALUES (118,112,12,3);
INSERT INTO "Order_items" VALUES (121,115,306,2);
INSERT INTO "Order_items" VALUES (123,117,69,3);
INSERT INTO "Order_items" VALUES (124,119,398,4);
INSERT INTO "Order_items" VALUES (132,126,83,4);
INSERT INTO "Order_items" VALUES (134,128,20,3);
INSERT INTO "Order_items" VALUES (141,134,12,1);
INSERT INTO "Order_items" VALUES (144,137,1,1);
INSERT INTO "Order_items" VALUES (148,142,20,1);
INSERT INTO "Order_items" VALUES (149,143,306,1);
INSERT INTO "Order_items" VALUES (153,147,69,1);
INSERT INTO "Order_items" VALUES (156,149,881,2);
INSERT INTO "Order_items" VALUES (161,154,1,2);
INSERT INTO "Order_items" VALUES (163,156,942,4);
INSERT INTO "Order_items" VALUES (168,161,306,2);
INSERT INTO "Order_items" VALUES (174,167,1,1);
INSERT INTO "Order_items" VALUES (175,168,12,2);
INSERT INTO "Order_items" VALUES (179,172,942,2);
INSERT INTO "Order_items" VALUES (182,175,881,1);
INSERT INTO "Order_items" VALUES (188,181,306,1);
INSERT INTO "Order_items" VALUES (196,189,881,2);
INSERT INTO "Order_items" VALUES (201,193,83,1);
INSERT INTO "Specification" VALUES (1,1,1,0.012);
INSERT INTO "Specification" VALUES (2,1,2,2.0);
INSERT INTO "Specification" VALUES (3,1,3,4.0);
INSERT INTO "Specification" VALUES (4,1,4,4.0);
INSERT INTO "Specification" VALUES (5,1,5,1.0);
INSERT INTO "Specification" VALUES (6,1,6,1.0);
INSERT INTO "Specification" VALUES (7,1,7,1.0);
INSERT INTO "Specification" VALUES (8,1,8,1.0);
INSERT INTO "Specification" VALUES (11,69,14,0.04);
INSERT INTO "Specification" VALUES (12,69,27,1.0);
INSERT INTO "Specification" VALUES (13,69,23,1.5);
INSERT INTO "Specification" VALUES (14,69,29,1.0);
INSERT INTO "Specification" VALUES (15,69,19,4.0);
INSERT INTO "Specification" VALUES (16,69,24,1.2);
INSERT INTO "Specification" VALUES (17,69,26,1.0);
INSERT INTO "Specification" VALUES (18,69,11,1.0);
INSERT INTO "Specification" VALUES (19,69,28,1.0);
INSERT INTO "Specification" VALUES (21,398,23,1.2);
INSERT INTO "Specification" VALUES (22,398,19,4.0);
INSERT INTO "Specification" VALUES (23,398,26,1.0);
INSERT INTO "Specification" VALUES (24,398,16,1.0);
INSERT INTO "Specification" VALUES (26,398,21,5.0);
INSERT INTO "Specification" VALUES (27,398,17,2.0);
INSERT INTO "Specification" VALUES (28,398,24,1.2);
INSERT INTO "Specification" VALUES (29,398,15,4.0);
INSERT INTO "Specification" VALUES (31,942,20,6.0);
INSERT INTO "Specification" VALUES (32,942,19,4.0);
INSERT INTO "Specification" VALUES (33,942,13,0.04);
INSERT INTO "Specification" VALUES (34,20,12,2.0);
INSERT INTO "Specification" VALUES (36,942,7,0.02);
INSERT INTO "Specification" VALUES (37,942,17,2.0);
INSERT INTO "Specification" VALUES (38,942,8,0.03);
INSERT INTO "Specification" VALUES (39,942,15,2.0);
INSERT INTO "Specification" VALUES (41,942,1,0.8);
INSERT INTO "Specification" VALUES (42,20,23,1.5);
INSERT INTO "Specification" VALUES (43,20,30,1.0);
INSERT INTO "Specification" VALUES (44,20,18,2.0);
INSERT INTO "Specification" VALUES (46,20,13,0.08);
INSERT INTO "Specification" VALUES (47,20,15,8.0);
INSERT INTO "Specification" VALUES (48,20,21,5.0);
INSERT INTO "Specification" VALUES (49,20,16,1.0);
INSERT INTO "Specification" VALUES (51,12,27,1.0);
INSERT INTO "Specification" VALUES (52,12,9,3.0);
INSERT INTO "Specification" VALUES (53,12,29,1.0);
INSERT INTO "Specification" VALUES (54,12,20,6.0);
INSERT INTO "Specification" VALUES (56,12,28,1.0);
INSERT INTO "Specification" VALUES (58,12,30,1.0);
INSERT INTO "Specification" VALUES (59,12,17,2.0);
INSERT INTO "Specification" VALUES (64,12,13,0.05);
INSERT INTO "Specification" VALUES (67,881,16,1.0);
INSERT INTO "Specification" VALUES (68,881,23,1.5);
INSERT INTO "Specification" VALUES (69,881,8,0.04);
INSERT INTO "Specification" VALUES (71,881,13,0.05);
INSERT INTO "Specification" VALUES (72,881,21,5.0);
INSERT INTO "Specification" VALUES (73,881,2,3.0);
INSERT INTO "Specification" VALUES (74,881,19,4.0);
INSERT INTO "Specification" VALUES (78,881,10,1.5);
INSERT INTO "Specification" VALUES (81,83,15,6.0);
INSERT INTO "Specification" VALUES (82,83,13,0.1);
INSERT INTO "Specification" VALUES (83,83,20,4.0);
INSERT INTO "Specification" VALUES (84,83,18,2.0);
INSERT INTO "Specification" VALUES (85,83,24,2.0);
INSERT INTO "Specification" VALUES (86,83,17,8.0);
INSERT INTO "Specification" VALUES (87,83,9,5.0);
INSERT INTO "Specification" VALUES (88,83,22,2.0);
INSERT INTO "Specification" VALUES (89,83,12,2.0);
INSERT INTO "Specification" VALUES (91,306,24,1.2);
INSERT INTO "Specification" VALUES (92,306,30,1.0);
INSERT INTO "Specification" VALUES (93,306,29,1.0);
INSERT INTO "Specification" VALUES (94,306,26,1.0);
INSERT INTO "Specification" VALUES (96,306,23,1.2);
INSERT INTO "Specification" VALUES (97,306,25,1.0);
INSERT INTO "Specification" VALUES (98,306,28,1.0);
INSERT INTO "Specification" VALUES (99,306,27,1.0);
INSERT INTO "Sales" VALUES (37,739,'Материал',0.0);
INSERT INTO "Sales" VALUES (14,14,'Материал',0.0);
INSERT INTO "Sales" VALUES (23,69,'Товар',0.0);
INSERT INTO "Sales" VALUES (48,189,'Материал',0.0);
INSERT INTO "Sales" VALUES (38,306,'Материал',0.0);
INSERT INTO "Sales" VALUES (28,881,'Товар',0.0);
INSERT INTO "Sales" VALUES (7,7,'Операция',0.0);
INSERT INTO "Sales" VALUES (44,915,'Материал',0.0);
INSERT INTO "Sales" VALUES (33,219,'Материал',0.0);
INSERT INTO "Sales" VALUES (19,19,'Материал',0.0);
INSERT INTO "Sales" VALUES (50,456,'Материал',0.0);
INSERT INTO "Sales" VALUES (20,20,'Материал',0.0);
INSERT INTO "Sales" VALUES (45,542,'Материал',0.0);
INSERT INTO "Sales" VALUES (25,20,'Товар',0.0);
INSERT INTO "Sales" VALUES (2,2,'Материал',0.0);
INSERT INTO "Sales" VALUES (32,671,'Материал',0.0);
INSERT INTO "Sales" VALUES (17,17,'Материал',0.0);
INSERT INTO "Sales" VALUES (21,1,'Товар',10.0);
INSERT INTO "Sales" VALUES (42,724,'Материал',0.0);
INSERT INTO "Sales" VALUES (39,862,'Материал',5.0);
INSERT INTO "Sales" VALUES (36,584,'Материал',0.0);
INSERT INTO "Sales" VALUES (46,273,'Материал',10.0);
INSERT INTO "Sales" VALUES (22,12,'Товар',5.0);
INSERT INTO "Sales" VALUES (4,4,'Материал',0.0);
INSERT INTO "Sales" VALUES (34,953,'Материал',10.0);
INSERT INTO "Sales" VALUES (9,9,'Материал',5.0);
INSERT INTO "Sales" VALUES (16,16,'Материал',0.0);
INSERT INTO "Sales" VALUES (18,18,'Материал',0.0);
INSERT INTO "Sales" VALUES (26,306,'Товар',0.0);
INSERT INTO "Sales" VALUES (12,12,'Материал',0.0);
INSERT INTO "Sales" VALUES (47,668,'Материал',0.0);
INSERT INTO "Sales" VALUES (13,13,'Материал',0.0);
INSERT INTO "Sales" VALUES (35,127,'Материал',0.0);
INSERT INTO "Sales" VALUES (5,5,'Материал',0.0);
INSERT INTO "Sales" VALUES (41,158,'Материал',0.0);
INSERT INTO "Sales" VALUES (24,83,'Товар',15.0);
INSERT INTO "Sales" VALUES (30,887,'Товар',0.0);
INSERT INTO "Sales" VALUES (11,11,'Материал',10.0);
INSERT INTO "Sales" VALUES (31,44,'Материал',5.0);
INSERT INTO "Sales" VALUES (15,15,'Материал',0.0);
INSERT INTO "Sales" VALUES (10,10,'Материал',0.0);
INSERT INTO "Sales" VALUES (1,1,'Материал',0.0);
INSERT INTO "Sales" VALUES (3,3,'Материал',0.0);
INSERT INTO "Sales" VALUES (6,6,'Операция',0.0);
INSERT INTO "Sales" VALUES (8,8,'Операция',0.0);
INSERT INTO "Sales" VALUES (15,15,'Материал',0.0);
INSERT INTO "Sales" VALUES (43,387,'Материал',0.0);
INSERT INTO "Sales" VALUES (27,942,'Товар',0.0);
INSERT INTO "Sales" VALUES (29,398,'Товар',0.0);
INSERT INTO "Sales" VALUES (40,491,'Материал',0.0);
INSERT INTO "Sales" VALUES (49,834,'Материал',0.0);
INSERT INTO "Prices" VALUES (101,1,'Материал',432.083333);
INSERT INTO "Prices" VALUES (102,2,'Материал',37.5);
INSERT INTO "Prices" VALUES (103,3,'Материал',17.125);
INSERT INTO "Prices" VALUES (104,4,'Материал',145.71875);
INSERT INTO "Prices" VALUES (105,5,'Материал',1242.5);
INSERT INTO "Prices" VALUES (106,6,'Операция',450.0);
INSERT INTO "Prices" VALUES (107,7,'Операция',1400.0);
INSERT INTO "Prices" VALUES (108,8,'Операция',1900.0);
INSERT INTO "Prices" VALUES (109,9,'Материал',450.0);
INSERT INTO "Prices" VALUES (110,10,'Материал',480.0);
INSERT INTO "Prices" VALUES (111,11,'Материал',550.0);
INSERT INTO "Prices" VALUES (112,12,'Материал',1500.0);
INSERT INTO "Prices" VALUES (113,13,'Материал',750.0);
INSERT INTO "Prices" VALUES (114,14,'Материал',180.0);
INSERT INTO "Prices" VALUES (115,15,'Материал',120.0);
INSERT INTO "Prices" VALUES (116,16,'Материал',250.0);
INSERT INTO "Prices" VALUES (117,17,'Материал',180.0);
INSERT INTO "Prices" VALUES (118,18,'Материал',320.0);
INSERT INTO "Prices" VALUES (119,19,'Материал',45.0);
INSERT INTO "Prices" VALUES (120,20,'Материал',15.0);
INSERT INTO "Prices" VALUES (121,21,'Материал',280.0);
INSERT INTO "Prices" VALUES (122,22,'Материал',650.0);
INSERT INTO "Prices" VALUES (123,23,'Материал',850.0);
INSERT INTO "Prices" VALUES (124,24,'Материал',350.0);
INSERT INTO "Prices" VALUES (125,25,'Материал',1200.0);
INSERT INTO "Prices" VALUES (126,26,'Операция',300.0);
INSERT INTO "Prices" VALUES (127,27,'Операция',800.0);
INSERT INTO "Prices" VALUES (128,28,'Операция',150.0);
INSERT INTO "Prices" VALUES (129,29,'Операция',1200.0);
INSERT INTO "Prices" VALUES (130,30,'Операция',200.0);
INSERT INTO "Prices" VALUES (201,1,'Товар',14120.0);
INSERT INTO "Prices" VALUES (202,12,'Товар',8500.0);
INSERT INTO "Prices" VALUES (203,69,'Товар',4200.0);
INSERT INTO "Prices" VALUES (204,83,'Товар',25000.0);
INSERT INTO "Prices" VALUES (205,20,'Товар',18500.0);
INSERT INTO "Prices" VALUES (206,306,'Товар',32000.0);
INSERT INTO "Prices" VALUES (207,942,'Товар',3500.0);
INSERT INTO "Prices" VALUES (208,881,'Товар',7800.0);
INSERT INTO "Prices" VALUES (209,398,'Товар',4500.0);
INSERT INTO "Prices" VALUES (210,887,'Товар',45000.0);
INSERT INTO "Prices" VALUES (311,44,'Материал',950.0);
INSERT INTO "Prices" VALUES (312,671,'Материал',180.0);
INSERT INTO "Prices" VALUES (313,219,'Материал',45.0);
INSERT INTO "Prices" VALUES (314,953,'Материал',1500.0);
INSERT INTO "Prices" VALUES (315,127,'Материал',1400.0);
INSERT INTO "Prices" VALUES (316,584,'Материал',200.0);
INSERT INTO "Prices" VALUES (317,739,'Материал',35.0);
INSERT INTO "Prices" VALUES (318,306,'Материал',12.0);
INSERT INTO "Prices" VALUES (319,862,'Материал',450.0);
INSERT INTO "Prices" VALUES (320,491,'Материал',85.0);
INSERT INTO "Prices" VALUES (421,158,'Материал',1200.0);
INSERT INTO "Prices" VALUES (422,724,'Материал',380.0);
INSERT INTO "Prices" VALUES (423,387,'Материал',150.0);
INSERT INTO "Prices" VALUES (424,915,'Материал',45.0);
INSERT INTO "Prices" VALUES (425,542,'Материал',15.0);
INSERT INTO "Prices" VALUES (426,273,'Материал',280.0);
INSERT INTO "Prices" VALUES (427,668,'Материал',850.0);
INSERT INTO "Prices" VALUES (428,189,'Материал',25.0);
INSERT INTO "Prices" VALUES (429,834,'Материал',35.0);
INSERT INTO "Prices" VALUES (430,456,'Материал',25.0);
INSERT INTO "Customers" VALUES (1,'ООО "Поставка"',NULL,'г.Пятигорск',79198634592,'Поставщик',NULL);
INSERT INTO "Customers" VALUES (2,'ООО "Кинотеатр Квант"','26320045123','г. Железноводск, ул. Мира, 123',79884581555,'Покупатель',NULL);
INSERT INTO "Customers" VALUES (3,'ООО "Ромашка"','4140784214','г. Омск, ул. Строителей, 294',79882584546,'Поставщик',NULL);
INSERT INTO "Customers" VALUES (8,'ООО "Новый JDTO"','26320045111','г. Железноводсу',79884581555,'Покупатель',NULL);
INSERT INTO "Customers" VALUES (9,'ООО "Ипподром"','5874045632','г. Уфа, ул. Набережная,  37',79627486389,'Поставщик',NULL);
INSERT INTO "Customers" VALUES (10,'ООО "Ассоль"','2629011278','г. Калуга, ул. Пушкина, 94',79184572398,'Покупатель',NULL);
INSERT INTO "Users" VALUES (1,'admin','admin','Администратор Системы','Администратор',0,0);
INSERT INTO "Products" VALUES (1,'Стол кухонный "Самобранка"','Кухня');
INSERT INTO "Products" VALUES (842,'Шкаф-купе "Мирож"','Спальня');
INSERT INTO "Products" VALUES (115,'Кресло-груша "Комфорт"','Гостиная');
INSERT INTO "Products" VALUES (509,'Тумба под обувь с сиденьем','Прихожая');
INSERT INTO "Products" VALUES (33,'Полка настенная "Лофт"','Гостиная');
INSERT INTO "Products" VALUES (712,'Кровать-трансформер "Умница"','Детская');
INSERT INTO "Products" VALUES (99,'Вешалка настенная "Ветвь"','Прихожая');
INSERT INTO "Products" VALUES (204,'Стол-книжка "Классика"','Кухня');
INSERT INTO "Products" VALUES (611,'Комод узкий "Минимал"','Спальня');
INSERT INTO "Products" VALUES (45,'Стеллаж угловой "Спектр"','Офис');
INSERT INTO "Products" VALUES (887,'Диван модульный "Архипелаг"','Гостиная');
INSERT INTO "Products" VALUES (156,'Тумба ТВ "Модерн"','Гостиная');
INSERT INTO "Products" VALUES (320,'Кресло офисное "Директор"','Офис');
INSERT INTO "Products" VALUES (77,'Зеркало напольное "Рост"','Спальня');
INSERT INTO "Products" VALUES (543,'Шкаф пенал "Верона"','Ванная');
INSERT INTO "Products" VALUES (901,'Стол детский регулируемый','Детская');
INSERT INTO "Products" VALUES (28,'Журнальный столик "Кофе"','Гостиная');
INSERT INTO "Products" VALUES (674,'Пуф круглый "Снежок"','Гостиная');
INSERT INTO "Products" VALUES (112,'Банкетка "Венеция"','Прихожая');
INSERT INTO "Products" VALUES (405,'Кровать двуспальная "Монако"','Спальня');
INSERT INTO "Products" VALUES (830,'Тумба прикроватная "Элегант"','Спальня');
INSERT INTO "Products" VALUES (51,'Стул барный "Хай-тек"','Кухня');
INSERT INTO "Products" VALUES (966,'Стол письменный "Бюро"','Офис');
INSERT INTO "Products" VALUES (219,'Шкаф-купе "Зеркальный"','Спальня');
INSERT INTO "Products" VALUES (738,'Диван-кровать "Еврокнижка"','Гостиная');
INSERT INTO "Products" VALUES (14,'Полка навесная "Лофт"','Гостиная');
INSERT INTO "Products" VALUES (582,'Комод с пеленальным столом','Детская');
INSERT INTO "Products" VALUES (304,'Кресло компьютерное "Геймер"','Офис');
INSERT INTO "Products" VALUES (89,'Комод с пеленальным столом','Детская');
INSERT INTO "Products" VALUES (441,'Стол складной "Пикник"','Кухня');
INSERT INTO "Products" VALUES (76,'Винный шкаф "Бордо"','Кухня');
INSERT INTO "Products" VALUES (923,'Тумба под раковину "Аква"','Ванная');
INSERT INTO "Products" VALUES (138,'Стеллаж металлический "Архив"','Офис');
INSERT INTO "Products" VALUES (655,'Кровать-чердак "Замок"','Детская');
INSERT INTO "Products" VALUES (27,'Барная стойка "Лофт"','Кухня');
INSERT INTO "Products" VALUES (810,'Шкаф детский "Сказка"','Детская');
INSERT INTO "Products" VALUES (49,'Стол переговорный "Босс"','Офис');
INSERT INTO "Products" VALUES (377,'Диван прямой "Лофт"','Гостиная');
INSERT INTO "Products" VALUES (702,'Тумба подкатная "Мобил"','Офис');
INSERT INTO "Products" VALUES (166,'Зеркало настенное "Рама"','Спальня');
INSERT INTO "Products" VALUES (530,'Кресло руководителя "Престиж"','Офис');
INSERT INTO "Products" VALUES (94,'Секция для гостиной "Стенка"','Гостиная');
INSERT INTO "Products" VALUES (259,'Столик для рисования','Детская');
INSERT INTO "Products" VALUES (732,'Кресло мягкое "Релакс"','Гостиная');
INSERT INTO "Products" VALUES (564,'Кровать-чердак "Мечта"','Детская');
INSERT INTO "Products" VALUES (709,'Буфет "Старина"','Гостиная');
INSERT INTO "Products" VALUES (250,'Пеленальный комод','Детская');
INSERT INTO "Products" VALUES (620,'Кровать-машина "Гонщик"','Детская');
INSERT INTO "Products" VALUES (268,'Детский стул "Рост"','Детская');
INSERT INTO "Products" VALUES (102,'Зеркало с подсветкой "LED"','Ванная');
INSERT INTO "Products" VALUES (254,'Шкаф для одежды 3-дверный','Спальня');
INSERT INTO "Products" VALUES (864,'Кровать односпальная "Студент"','Спальня');
INSERT INTO "Products" VALUES (149,'Детский стол "Школьник"','Детская');
INSERT INTO "Products" VALUES (958,'Обувница "Компакт"','Прихожая');
INSERT INTO "Products" VALUES (840,'Стул барный высокий','Кухня');
INSERT INTO "Products" VALUES (292,'Столик журнальный стеклянный','Гостиная');
INSERT INTO "Products" VALUES (862,'Органайзер настольный','Офис');
INSERT INTO "Products" VALUES (20,'Кровать двуспальная "Сон"','Спальня');
INSERT INTO "Products" VALUES (348,'Банкетка мягкая "Прованс"','Прихожая');
INSERT INTO "Products" VALUES (482,'Полотенцедержатель "Хром"','Ванная');
INSERT INTO "Products" VALUES (799,'Тумба подкатная 3-ящичная','Офис');
INSERT INTO "Products" VALUES (1042,'Шкаф-купе "Мирож"','Спальня');
INSERT INTO "Products" VALUES (88,'Кресло-груша "Комфорт"','Гостиная');
INSERT INTO "Products" VALUES (512,'Тумба под обувь с сиденьем','Прихожая');
INSERT INTO "Products" VALUES (333,'Полка настенная "Лофт"','Гостиная');
INSERT INTO "Products" VALUES (714,'Кровать-трансформер "Умница"','Детская');
INSERT INTO "Products" VALUES (91,'Вешалка настенная "Ветвь"','Прихожая');
INSERT INTO "Products" VALUES (206,'Стол-книжка "Классика"','Кухня');
INSERT INTO "Products" VALUES (613,'Комод узкий "Минимал"','Спальня');
INSERT INTO "Products" VALUES (47,'Стеллаж угловой "Спектр"','Офис');
INSERT INTO "Products" VALUES (889,'Диван модульный "Архипелаг"','Гостиная');
INSERT INTO "Products" VALUES (158,'Тумба ТВ "Модерн"','Гостиная');
INSERT INTO "Products" VALUES (322,'Кресло офисное "Директор"','Офис');
INSERT INTO "Products" VALUES (79,'Зеркало напольное "Рост"','Спальня');
INSERT INTO "Products" VALUES (545,'Шкаф пенал "Верона"','Ванная');
INSERT INTO "Products" VALUES (903,'Стол детский регулируемый','Детская');
INSERT INTO "Products" VALUES (676,'Пуф круглый "Снежок"','Гостиная');
INSERT INTO "Products" VALUES (114,'Банкетка "Венеция"','Прихожая');
INSERT INTO "Products" VALUES (407,'Кровать двуспальная "Монако"','Спальня');
INSERT INTO "Products" VALUES (832,'Тумба прикроватная "Элегант"','Спальня');
INSERT INTO "Products" VALUES (53,'Стул барный "Хай-тек"','Кухня');
INSERT INTO "Products" VALUES (968,'Стол письменный "Бюро"','Офис');
INSERT INTO "Products" VALUES (221,'Шкаф-купе "Зеркальный"','Спальня');
INSERT INTO "Products" VALUES (740,'Диван-кровать "Еврокнижка"','Гостиная');
INSERT INTO "Products" VALUES (584,'Комод с пеленальным столом','Детская');
INSERT INTO "Products" VALUES (306,'Кресло компьютерное "Геймер"','Офис');
INSERT INTO "Products" VALUES (443,'Стол складной "Пикник"','Кухня');
INSERT INTO "Products" VALUES (925,'Тумба под раковину "Аква"','Ванная');
INSERT INTO "Products" VALUES (140,'Стеллаж металлический "Архив"','Офис');
INSERT INTO "Products" VALUES (657,'Кровать-чердак "Замок"','Детская');
INSERT INTO "Products" VALUES (812,'Шкаф детский "Сказка"','Детская');
INSERT INTO "Products" VALUES (379,'Диван прямой "Лофт"','Гостиная');
INSERT INTO "Products" VALUES (704,'Тумба подкатная "Мобил"','Офис');
INSERT INTO "Products" VALUES (532,'Кресло руководителя "Престиж"','Офис');
INSERT INTO "Products" VALUES (108,'Кухонный гарнитур "Мини"','Кухня');
INSERT INTO "Products" VALUES (415,'Пенал для ванной "Компакт"','Ванная');
INSERT INTO "Products" VALUES (777,'Стол компьютерный с тумбой','Офис');
INSERT INTO "Products" VALUES (69,'Стул офисный "Менеджер"','Офис');
INSERT INTO "Products" VALUES (308,'Диван-кровать "Аккорд"','Гостиная');
INSERT INTO "Products" VALUES (288,'Стол компьютерный с тумбой','Офис');
INSERT INTO "Products" VALUES (83,'Шкаф-купе "Гранд"','Спальня');
INSERT INTO "Products" VALUES (12,'Стол письменный "Офис"','Офис');
INSERT INTO "Products" VALUES (382,'Кресло компьютерное "Геймер"','Офис');
INSERT INTO "Products" VALUES (768,'Сервировочная тележка','Кухня');
INSERT INTO "Products" VALUES (143,'Кресло-качалка "Релакс"','Гостиная');
INSERT INTO "Products" VALUES (813,'Мольберт детский "Юный художник"','Детская');
INSERT INTO "Products" VALUES (453,'Подставка для монитора "Эрго"','Офис');
INSERT INTO "Products" VALUES (150,'Кухонный гарнитур "Мини"','Кухня');
INSERT INTO "Products" VALUES (37,'Пенал для ванной "Узкий"','Ванная');
INSERT INTO "Products" VALUES (373,'Качалка деревянная "Лошадка"','Детская');
INSERT INTO "Products" VALUES (792,'Шкаф-пенал для ванной "Влага"','Ванная');
INSERT INTO "Products" VALUES (875,'Тумба под раковину "Сифон"','Ванная');
INSERT INTO "Products" VALUES (821,'Письменный стол угловой "Босс"','Офис');
INSERT INTO "Products" VALUES (770,'Пуф мягкий "Куб"','Гостиная');
INSERT INTO "Products" VALUES (718,'Вешалка настенная "Крючки"','Прихожая');
INSERT INTO "Products" VALUES (634,'Табурет деревянный "Классик"','Кухня');
INSERT INTO "Products" VALUES (277,'Шкаф для игрушек "Сундук"','Детская');
INSERT INTO "Products" VALUES (687,'Стол детский с партой "Парта"','Детская');
INSERT INTO "Products" VALUES (731,'Стол складной "Дача"','Кухня');
INSERT INTO "Products" VALUES (197,'Зеркало в пол "Роковой"','Прихожая');
INSERT INTO "Products" VALUES (271,'Барная стойка "Лофт" (угловая)','Кухня');
INSERT INTO "Products" VALUES (860,'Тумба ТВ "Модерн" (длинная)','Гостиная');
INSERT INTO "Products" VALUES (361,'Стеллаж металлический "Склад"','Офис');
INSERT INTO "Products" VALUES (805,'Ящик для игрушек "Мягкий"','Детская');
INSERT INTO "Products" VALUES (217,'Матрас ортопедический "Сон"','Спальня');
INSERT INTO "Products" VALUES (823,'Кресло руководителя "Престиж" (экокожа)','Офис');
INSERT INTO "Products" VALUES (887,'Стол переговорный "Босс" (овальный)','Офис');
INSERT INTO "Products" VALUES (971,'Вешалка напольная "Дерево"','Прихожая');
INSERT INTO "Products" VALUES (1024,'Стол раздвижной "Праздник"','Кухня');
COMMIT;
