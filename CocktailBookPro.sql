CREATE DATABASE cocktailbook_pro;

CREATE TABLE logins
(
id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(50) NOT NULL UNIQUE,
password_hash VARCHAR(200) NOT NULL
);

CREATE TABLE users
(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
username VARCHAR(50) NOT NULL UNIQUE,
birthdate DATE NOT NULL,
email VARCHAR(100) NOT NULL,
mobile_phone VARCHAR(15) NOT NULL,
password_hash VARCHAR(200) NOT NULL,
registered_at DATETIME DEFAULT CURRENT_TIMESTAMP,
last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fk_id
FOREIGN KEY (id)
REFERENCES logins(id)
);

CREATE TABLE recipes
(
id INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(50) NOT NULL,
user_id INT,
`description` TEXT,
published_at DATETIME DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fk_user_id
FOREIGN KEY (user_id)
REFERENCES logins(id)
);

CREATE TABLE recipe_comments
(
id INT AUTO_INCREMENT PRIMARY KEY,
recipe_id INT,
user_id INT,
content TEXT,
published_at DATETIME DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fk_recipe_id
FOREIGN KEY (recipe_id)
REFERENCES recipes(id),
CONSTRAINT fk_user_id_comments
FOREIGN KEY (user_id)
REFERENCES logins(id)
);

CREATE TABLE cocktail_categories
(
id INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE cocktail_categories_recipes
(
recipe_category_id INT,
recipe_id INT,
PRIMARY KEY (recipe_category_id, recipe_id),
CONSTRAINT fk_recipe_category_id
FOREIGN KEY (recipe_category_id)
REFERENCES cocktail_categories(id),
CONSTRAINT fk_recipe_id_categories
FOREIGN KEY (recipe_id)
REFERENCES recipes(id)
);

CREATE TABLE ingredients
(
id INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE recipe_ingredients
(
recipe_id INT,
ingredient_id INT,
amount DOUBLE NOT NULL,
unit VARCHAR(25),
CONSTRAINT fk_recipe_id_ingredients
FOREIGN KEY (recipe_id)
REFERENCES recipes(id),
CONSTRAINT fk_ingredient_id
FOREIGN KEY (ingredient_id)
REFERENCES ingredients(id)
);

CREATE TABLE recipe_steps
(
id INT AUTO_INCREMENT PRIMARY KEY,
recipe_id INT,
step_number INT NOT NULL,
`description` TEXT NOT NULL,
CONSTRAINT fk_recipe_id_steps
FOREIGN KEY (recipe_id)
REFERENCES recipes(id)
);

CREATE TABLE ingredients_categories
(
id INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE ingredients_categories_ingredients
(
ingredient_category_id INT,
cocktail_ingredients_id INT,
PRIMARY KEY (ingredient_category_id, cocktail_ingredients_id),
CONSTRAINT fk_ingredient_category_id
FOREIGN KEY (ingredient_category_id)
REFERENCES ingredients_categories(id),
CONSTRAINT fk_cocktail_ingredients_id
FOREIGN KEY (cocktail_ingredients_id)
REFERENCES ingredients(id)
);

INSERT INTO logins(username, password_hash)
VALUES ('Drinkgenix', 'B523D8ED6FBA713B947CB9D8DC5FB01398B61D73'),
       ('Cocktailium', '5CF46E7701676FFA707A623E0284715FD17C321A'),
       ('Drinkverse', '5395BF10A900E1A4117D367D2873742F1D1EEF4D'),
       ('Drinklux', '6D9CA655C47546D347006F1E6D8AE919BCA089DB'),
       ('Drinklytical', '30BFCDE9074211A05F8D1DEE9D1F1789ACFB74EA'),
       ('Drinklia', 'E0E00F68AFC3BFEAAC1C6C4212DF435A563F2FB4'),
       ('Cocktailcog', '059E901CD16CF581A2F2894A09B64D68A2D41383'),
       ('Cocktailly', 'DD39E60263D1A45BAAD35128835AD7A842A7A09F'),
       ('Cocktailsio', '240C8D860C61A18D4606C746F11605FA4330103C'),
       ('Cocktailvio', 'C2B13EE978D588A0BAB21F6CCC3CB871DE017A2E'),
       ('Drinkify', '5961034F10990B49058749236DEA3D58F359CB94'),
       ('Cocktailoont', 'B7BC1CF93F0D25B42A9FBECB4496C8F947FBFBA9'),
       ('Drinkcog', '4DD6D2946663D52830F37E0DB591BD62AABD65D3'),
       ('Cocktailgenics', '2915BCE865CBF2B820C6E3680D63CEC0BB67AB1E'),
       ('Drinkara', '20EB8CB873FFECB082D6A315A8287D971E7E5820'),
       ('Cocktailquipo', 'B65386117882B2828CED01A47B15D5A8A834BB8A'),
       ('Drinkya', '8ED7264B18360920C1D0D1B30A226CAD37EECCAC'),
       ('Drinkology', 'F98373BCC18F515CA74E524C7989F26F43014EF9'),
       ('Drinknetic', '937BA331FC75CB7D2544962C6046AF59D3B13763'),
       ('Cocktailprism', 'A8150D8AA3286B7AFA98CC08463987C1744E00DD'),
       ('Cocktailsy', 'D504CCBF4EBB18673B9653C40E63BECE5EBC60A9'),
       ('Drinkdo', 'BF09FA3AAA72615A54CDA596AD0B48C88861966A'),
       ('Cocktailaholic', '5E02FD0E3C3E741BF9F756E693A93B70BC397DE8'),
       ('Cocktailistic', '17809A62E0CA884D9A4906FC86A91AA7945F5823');

INSERT INTO users(first_name, last_name, username, birthdate, email, mobile_phone, password_hash, registered_at, last_login)
VALUES ('Ricky', 'Mccarthy', 'Drinkgenix', '1971-04-01', 'crimsane@verizon.net', '(516)538-1328', 'B523D8ED6FBA713B947CB9D8DC5FB01398B61D73', '2020-04-13 10:11:09', '2021-03-12 02:53:24'),
       ('Jamie', 'Donnely', 'Cocktailium', '1971-08-03', 'skaufman@gmail.com', '(781)453-2483', '5CF46E7701676FFA707A623E0284715FD17C321A', '2021-02-13 14:45:48', '2020-01-09 18:22:21'),
       ('Jack', 'Bush', 'Drinkverse', '1972-01-25', 'msherr@live.com', '(307)377-8606', '5395BF10A900E1A4117D367D2873742F1D1EEF4D', '2020-09-18 04:35:31', '2021-01-25 22:37:04'),
       ('Adam', 'Walters', 'Drinklux', '1974-09-28', 'amimojo@yahoo.com', '(575)424-3641', '6D9CA655C47546D347006F1E6D8AE919BCA089DB', '2021-01-03 20:54:55', '2020-10-08 11:58:58'),
       ('Zak', 'Farmer', 'Drinklytical', '1975-04-11', 'parrt@comcast.net',	'(503)716-1650', '30BFCDE9074211A05F8D1DEE9D1F1789ACFB74EA', '2020-11-28 03:40:08',	'2020-04-09 18:41:50'),
       ('Lucas', 'Wolf', 'Drinklia', '1976-01-12', 'luebke@hotmail.com', '(225)395-7719', 'E0E00F68AFC3BFEAAC1C6C4212DF435A563F2FB4', '2020-08-27 06:47:38', '2020-07-21 11:51:26'),
       ('Brendan', 'Morgan', 'Cocktailcog', '1976-07-17', 'noticias@sbcglobal.net', '(530)227-3575', '059E901CD16CF581A2F2894A09B64D68A2D41383', '2021-02-05 03:27:34',	'2020-02-21 06:07:12'),
       ('Haider', 'Richardson',	'Cocktailly', '1976-12-30',	'jramio@sbcglobal.net',	'(636)660-2415', 'DD39E60263D1A45BAAD35128835AD7A842A7A09F', '2020-08-28 09:45:46',	'2020-09-11 11:09:47'),
       ('Ciaran', 'Steele',	'Cocktailsio', '1979-04-13', 'joglo@comcast.net', '(626)991-1764', '240C8D860C61A18D4606C746F11605FA4330103C', '2020-09-20 15:13:39', '2021-03-18 10:37:24'),
       ('Mark', 'Spence', 'Cocktailvio', '1979-12-29', 'doche@verizon.net',	'(310)381-5087', 'C2B13EE978D588A0BAB21F6CCC3CB871DE017A2E', '2020-06-22 23:04:28', '2020-04-17 13:24:08'),
       ('Eddie', 'Jensen', 'Drinkify', '1980-09-09', 'ralamosm@comcast.net', '(252)426-3216', '5961034F10990B49058749236DEA3D58F359CB94', '2020-11-26 00:29:01', '2020-11-08 17:53:58'),
       ('Taylor', 'Adams', 'Cocktailoont', '1981-03-16', 'rfisher@hotmail.com', '(704)940-3075', 'B7BC1CF93F0D25B42A9FBECB4496C8F947FBFBA9', '2020-09-12 10:30:50', '2021-03-19 22:32:09'),
       ('Rebecca', 'Reese', 'Drinkcog', '1984-07-12', 'animats@optonline.net', '(410)462-9796', '4DD6D2946663D52830F37E0DB591BD62AABD65D3', '2020-01-17 03:32:30', '2020-02-14 14:31:50'),
       ('Penelope', 'Barnett', 'Cocktailgenics', '1985-03-18', 'esbeck@hotmail.com', '(478)789-5711', '2915BCE865CBF2B820C6E3680D63CEC0BB67AB1E', '2020-09-16 17:34:08', '2021-01-16 12:42:04'),
       ('Holly', 'Allen', 'Drinkara', '1985-04-28', 'sburke@yahoo.ca', '(502)396-3169', '20EB8CB873FFECB082D6A315A8287D971E7E5820', '2020-10-03 08:10:32', '2020-09-07 19:24:41'),
       ('Rose', 'Conner', 'Cocktailquipo', '1985-07-26', 'gfody@icloud.com', '(386)627-2447', 'B65386117882B2828CED01A47B15D5A8A834BB8A', '2020-06-11 08:07:32', '2020-07-22 04:46:50'),
       ('Paige', 'Thomas', 'Drinkya', '1985-10-25', 'bsikdar@comcast.net', '(317)333-4034', '8ED7264B18360920C1D0D1B30A226CAD37EECCAC', '2020-06-03 02:28:46', '2020-08-20 09:11:21'),
       ('Hanna', 'Jackson', 'Drinkology', '1990-10-20', 'jdray@yahoo.ca', '(336)464-5563', 'F98373BCC18F515CA74E524C7989F26F43014EF9', '2020-12-09 15:18:21', '2021-02-23 12:32:04'),
       ('Irene', 'Daniels', 'Drinknetic', '1992-04-22', 'shang@aol.com', '(272)888-1206', '937BA331FC75CB7D2544962C6046AF59D3B13763', '2020-11-02 18:44:56', '2020-09-28 04:18:24'),
       ('Lily', 'Barker', 'Cocktailprism', '1993-06-23', 'kawasaki@yahoo.com', '(623)876-7649', 'A8150D8AA3286B7AFA98CC08463987C1744E00DD', '2020-04-26 13:54:41', '2020-05-14 14:49:33'),
       ('Emilia', 'Torres', 'Cocktailsy', '1996-09-18', 'bcevc@mac.com', '(225)395-9062', 'D504CCBF4EBB18673B9653C40E63BECE5EBC60A9', '2020-02-12 22:00:13', '2020-10-11 04:13:59'),
       ('Maya', 'Reyes', 'Drinkdo', '1999-02-23', 'dalamb@live.com', '(434)939-7529', 'BF09FA3AAA72615A54CDA596AD0B48C88861966A', '2020-01-19 15:49:40', '2020-08-04 17:14:22'),
       ('Bonnie', 'Leon', 'Cocktailaholic', '1999-11-29', 'maratb@outlook.com', '(272)762-3777', '5E02FD0E3C3E741BF9F756E693A93B70BC397DE8', '2020-10-17 07:21:35', '2020-07-20 05:40:20'),
       ('Olivia', 'Chapman', 'Cocktailistic', '2001-07-17', 'rnewman@verizon.net', '(684)252-9917', '17809A62E0CA884D9A4906FC86A91AA7945F5823', '2020-11-13 17:24:28', '2020-01-26 16:05:33');

       
INSERT INTO cocktail_categories(`name`)
VALUES ('alcoholic'),
       ('non-alcoholic');
       
INSERT INTO ingredients(`name`)
VALUES ('Sugar syrup'),
       ('Lime juice'),
       ('Lemon juice'),
       ('London dry gin'),
       ('Vodka'),
       ('Light white rum'),
       ('Angostura Aromatic Bitters'),
       ('Orange juice'),
       ('Triple sec liqueur'),
       ('Dry vermouth'),
       ('Cognac V.S.O.P.'),
       ('Pineapple juice'),
       ('Sweeth vermouth'),
       ('Bourbon whiskey'),
       ('Apple juice'),
       ('Pomegranate syrup'),
       ('Tequila'),
       ('Egg white'),
       ('Orange bitters'),
       ('Cranberry juice'),
       ('Grand Marnier liqueur'),
       ('Soda'),
       ('Cream'),
       ('Maraschino liqueur'),
       ('Blended Scotch whicky'),
       ('Fresh mint'),
       ('Brut champagne'),
       ('Grapefruit juice'),
       ('Elderflower liqueur'),
       ('Absinthe'),
       ('Apricot brandy liqueur'),
       ('Coffee liqueur'),
       ('Campari Bitter'),
       ('Calvados apple brandy'),
       ('Amaretto liqueur'),
       ('Milk'),
       ('Black raspberry liqueur'),
       ('Runny honey'),
       ('Benedictine D.O.M. liqueur'),
       ('White creme de cacao liqueur'),
       ('Peychaud\'s aromatic bitters'),
       ('Aged rum'),
       ('Citrus flavoured vodka'),
       ('Chartreuse Vert'),
       ('Cherry brandy liqueur'),
       ('Irish cream liqueur'),
       ('Almond syrup'),
       ('Cachaca'),
       ('Lime cordial'),
       ('Raspberries'),
       ('Golden rum'),
       ('Ginger ale'),
       ('Creme de cassis'),
       ('Melon liqueur'),
       ('Galliano L\'Autentico liqueur'),
       ('Blue curacao liqueur'),
       ('Drambuie liqueur'),
       ('Vanilla infused vodka'),
       ('Straight rye whiskey'),
       ('Hazelnut liqueur'),
       ('Zubrowka bison grass vodka'),
       ('Fino sherry'),
       ('Maple syrup'),
       ('Islay single malt Scotch whisky'),
       ('Agave syrup'),
       ('Chartreuse Jaune'),
       ('Peach Schnapps liqueur'),
       ('Creme de banane liqueur'),
       ('Port wine'),
       ('White wine'),
       ('Pisco'),
       ('Apple Schnapps liqueur'),
       ('Ginger beer'),
       ('Falernum liqueur'),
       ('Lemonade'),
       ('Coconut rum liqueur'),
       ('White sreme de menthe'),
       ('Ginger liqueur'),
       ('Southern Comfort liqueur'),
       ('Dark creme de cacao liqueur'),
       ('Basil leaves'),
       ('Dubonnet Red'),
       ('Passion fruit syrup'),
       ('Jenever'),
       ('Vodka raspberry flavoured'),
       ('Sake'),
       ('Ovenproof rum'),
       ('Strawberries'),
       ('Ginger'),
       ('Navy rum'),
       ('Prosecco sparkling wine'),
       ('Vanilla sugar syrup'),
       ('Passion fruit'),
       ('Lillet Blanc'),
       ('Honey sugar syrup'),
       ('Espresso coffee'),
       ('Black pepper'),
       ('Tonic water'),
       ('Anise liqueur'),
       ('Creme de framboise liqueur'),
       ('Salt'),
       ('Ice'),
       ('Sugar'),
       ('Cointreau'),
       ('Olives'),
       ('Lime'),
       ('Lemon'),
       ('Cherries'),
       ('Peach'),
       ('Orange'),
       ('Pineapple'),
       ('Tomato juice'),
       ('Coffee'),
       ('Chocolate'),
       ('Coconut cream'),
       ('Creme de Mure'),
       ('Blackberry'),
       ('Simple syrup'),
       ('Coca Cola'),
       ('Peppered vodka'),
       ('Red wine'),
       ('Worcestershire sauce'),
       ('Tobasco sauce'),
       ('Cucumber'),
       ('Kahlua'),
       ('Sparkling water'),
       ('Peach nectar'),
       ('Sparkling apple cider'),
       ('Blackberry syrup');
       
INSERT INTO ingredients_categories(`name`)
VALUES ('Alcohol'),
	   ('Juices'),
       ('Spices'),
       ('Fruits'),
       ('Syrups'),
       ('Liquids'),
       ('Herbs'),
       ('Others');
       
INSERT INTO recipes(`name`, user_id, `description`, published_at)
VALUES ('Mojito', 3, 'Refreshing and easy drinking cocktail.', '2020-09-21 17:20:10'),
       ('Martini', 11, 'Quite a simple cocktail, made with just gin & vermouth and garnished either with an olive or a lemon twist.', '2020-09-27 10:31:46'),
       ('Daiquiri', 15, 'Sweet and tart, this is still one of the best concoctions you can make.', '2020-12-17 11:51:07'),
       ('Old Fashioned', 6, 'A firm favourite at Social and Cocktail HQ, made properly, this is the taste of cocktail heaven!', '2021-03-07 11:36:09'),
       ('Cosmopolitan', 10, 'The Cosmopolitan Cocktail is a colourful, fruity concoction made with citron vodka, triple sec, cranberry juice and freshly squeezed lime juice.', '2020-02-16 18:25:58'),
       ('Caipirinha', 9, 'To make a Caipirinha you need Cachaca, and to make Cachaca you need sugar cane juice.', '2020-03-31 20:37:31'),
       ('White Russian', 14, 'This White Russian recipe is one of the most popular of all cocktails, and with good reason. It has a deep, smooth flavour and is the perfect drink to kick back and relax with.', '2020-01-26 14:50:00'),
       ('Pina Colada', 23, 'The classic Pina Colada is perhaps our very favourite of all the Tiki-style family of drinks.Creamy and tropical flavours don’t work much better than this!', '2021-01-03 21:03:41'),
       ('Bramble', 5, 'The pairing of the gin, blackberry and lemon comes together to create a light tasting and refreshing cocktail which has long been one of our favourites at Social and Cocktail HQ.', '2020-07-31 14:04:31'),
       ('Margarita', 18, 'the most common tequila-based cocktail in the world.', '2020-05-23 10:17:05'),
       ('Cuba Libre', 21, 'The Cuba Libre is a popular rum cocktail which means “Free Cuba” in Spanish.', '2020-05-13 12:11:51'),
       ('Bloody Mary', 12, 'The Bloody Mary cocktail is often found on Top 10 lists prescribing to be the world’s favourite cocktails and due to its myriad of unusual ingredients it certainly is a unique & complicated mixed drink.', '2020-12-19 21:22:43'),
       ('Manhattan', 1, 'The Manhattan is one of our Top 5 drinks at Social and Cocktail HQ.', '2020-09-13 10:12:07'),
       ('Espresso Martini', 17, 'A silky smooth martini with that caffeinated kick to keep the night going that extra hour longer!', '2020-09-20 16:17:45'),
       ('El Diablo', 22, 'A popular tequila cocktail with the cassis melding perfectly with the ginger and the agave flavour of the tequila.', '2020-07-21 10:48:06'),
       ('Sea Breeze', 24, 'As easy to drink as it is to make. A fun and refreshing cocktail.', '2020-10-01 22:47:03'),
       ('White Lady', 8, 'The White Lady is a very clean-tasting cocktail, which makes it the perfect aperitif.', '2020-02-14 15:43:51'),
       ('Sazerac', 19, 'A tried and tested classic, if you have never tasted a Sazerac its really time that changed!', '2020-05-12 14:45:13'),
       ('Cranberry Sparkler', 5, 'This refreshing drink is great on a hot day.', '2020-06-17 15:33:27'),
       ('Alkohol-Free Bellini', 4, 'This nonalcoholic drink is the perfect accompaniment; it tastes special occasion-ish, but even the mom-to-be can enjoy this delicious brunch mocktail.', '2020-01-14 21:29:12'),
       ('Blackberry Nojito', 17, 'Mint and blackberries are the perfect refreshing mocktail; this blend is a take-off on the traditional mojito only without the rum.', '2020-01-05 13:34:32');
       
INSERT INTO recipe_comments(recipe_id, user_id, content, published_at)
VALUES (1, 20, 'The traditional Cuban Mojito uses sparkling water and all the ingredients should be added first before adding the ice.', '2020-10-07 18:34:03'),
       (2, 13, 'Made this recipe using premium vodka and premium vermouth. It was excellent.', '2020-11-23 22:53:57'),
       (4, 8, 'This is the style from outdated to the new school, that is the thing that everybody needs to include it up! Thanks for sharing it.', '2021-03-17 19:10:36'),
       (6, 16, 'In Brazil this is made perfect by the addition of passion fruit to taste... It\'s then called Caipirinha maracuja. If you haven\'t got cachaça, substitute with vodka for a caipiroska.', '2020-05-22 14:33:05'),
       (7, 3, 'Complaining about being \'very strong\'? Use decent vodka', '2020-06-14 22:35:50'),
       (8, 15, 'Tasty and simple, used cocktail cherries as a cheaper/easier garnish.', '2021-02-05 20:55:03'),
       (14, 11, 'Definitely no syrup required. Use a measure of creme de cacao instead.', '2020-10-01 16:40:44');
       
INSERT INTO cocktail_categories_recipes(recipe_category_id, recipe_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (1, 4),
       (1, 5),
       (1, 6),
       (1, 7),
       (1, 8),
       (1, 9),
       (1, 10),
       (1, 11),
       (1, 12),
       (1, 13),
       (1, 14),
       (1, 15),
       (1, 16),
       (1, 17),
       (1, 18),
       (2, 19),
       (2, 20),
       (2, 21);
       
INSERT INTO recipe_ingredients(recipe_id, ingredient_id, amount, unit)
VALUES (1, 6, 50, 'ml'),
       (1, 26, 8, 'leaves'),
       (1, 1, 12.5, 'ml'),
       (1, 2, 25, 'ml'),
       (1, 26, 2, 'sprigs'),
       (2, 4, 50, 'ml'),
       (2, 10, 10, 'ml'),
       (2, 107, 1, 'twist'),
       (3, 6, 50, 'ml'),
       (3, 103, 1.5, 'bar spoons'),
       (3, 2, 25, 'ml'),
       (3, 106, 1, 'slice'),
       (4, 14, 50, 'ml'),
       (4, 7, 2, 'dashes'),
       (4, 19, 1, 'dash'),
       (4, 103, 1, 'bar spoon'),
       (4, 110, 1, 'peel'),
       (5, 43, 37.5, 'ml'),
       (5, 9, 12.5, 'ml'),
       (5, 20, 30, 'ml'),
       (5, 107, 0.5, 'squeezed'),
       (5, 1, 12.5, 'ml'),
       (6, 48, 50, 'ml'),
       (6, 106, 0.5, 'chopped'),
       (6, 103, 1, 'teaspoon'),
       (6, 106, 1, 'wedge'),
       (7, 5, 37.5, 'ml'),
       (7, 32, 25, 'ml'),
       (7, 23, 15, 'ml'),
       (7, 36, 15, 'ml'),
       (7, 115, 1, 'sprinkle'),
       (7, 114, 1, 'bean'),
       (8, 4, 50, 'ml'),
       (8, 12, 100, 'ml'),
       (8, 115, 25, 'ml'),
       (8, 23, 25, 'ml'),
       (8, 111, 1, 'slice'),
       (8, 101, 1, 'pinch'),
       (9, 4, 50, 'ml'),
       (9, 116, 10, 'ml'),
       (9, 3, 25, 'ml'),
       (9, 1, 12.5, 'ml'),
       (9, 117, 1, 'piece'),
       (10, 17, 37.5, 'ml'),
       (10, 9, 12.5, 'ml'),
       (10, 2, 25, 'ml'),
       (10, 118, 12.5, 'ml'),
       (10, 101, 1, 'pinch'),
       (11, 42, 50, 'ml'),
       (11, 106, 8, 'wedge'),
       (11, 119, 100, 'ml'),
       (11, 106, 1, 'wedge'),
       (12, 120, 37.5, 'ml'),
       (12, 13, 15, 'ml'),
       (12, 112, 35, 'ml'),
       (12, 121, 1, 'splash'),
       (12, 122, 6, 'splashes'),
       (12, 123, 10, 'dashes'),
       (12, 3, 25, 'ml'),
       (12, 101, 10, 'dashes'),
       (12, 97, 10, 'dashes'),
       (12, 124, 3, 'slices'),
       (13, 14, 50, 'ml'),
       (13, 13, 10, 'ml'),
       (13, 10, 10, 'ml'),
       (13, 7, 2, 'dashes'),
       (13, 110, 1, 'leel'),
       (14, 58, 37.5, 'ml'),
       (14, 125, 12.5, 'ml'),
       (14, 96, 1, 'double'),
       (14, 1, 12.5, 'ml'),
       (14, 113, 3, 'beans'),
       (15, 17, 37.5, 'ml'),
       (15, 53, 12.5, 'ml'),
       (15, 2, 12.5, 'ml'),
       (15, 73, 1, 'splash'),
       (16, 5, 50, 'ml'),
       (16, 20, 50, 'ml'),
       (16, 28, 37.5, 'ml'),
       (16, 106, 1, 'slice'),
       (17, 4, 50, 'ml'),
       (17, 9, 25, 'ml'),
       (17, 3, 25, 'ml'),
       (17, 107, 1, 'rind'),
       (18, 59, 50, 'ml'),
       (18, 30, 5, 'ml'),
       (18, 41, 3, 'dashes'),
       (18, 103, 1, 'cube'),
       (18, 107, 1, 'peel'),
       (19, 102, 1, 'glass'),
       (19, 20, 6, 'ounces'),
       (19, 2, 1, 'of one lime'),
       (19, 126, 2, 'ounces'),
       (19, 110, 1, 'wedge'),
       (20, 127, 2, 'ounces'),
       (20, 128, 1, 'bottle'),
       (20, 109, 1, 'slice'),
       (21, 26, 10, 'sprigs'),
       (21, 129, 1, 'ounce'),
       (21, 2, 1, 'of three limes'),
       (21, 102, 1, 'handful'),
       (21, 22, 1, 'bottle'),
       (21, 117, 1, 'handful');
       
INSERT INTO recipe_steps(recipe_id, step_number, `description`)
VALUES (1, 1, 'Add the white rum to a highball glass.'),
	   (1, 2, 'Add 8 – 10 mint leaves and sugar syrup and lime juice.'),
       (1, 3, 'Muddle with bar spoon.'),
       (1, 4, 'Add crushed ice and a splash of soda.'),
       (1, 5, 'Mix drink down with bar spoon. Taste.'),
	   (1, 6, 'Top up with more crushed ice.'),
       (1, 7, 'Slap 2 mint sprigs to release essence and put into drink.'),
       (1, 8, 'Add small splash of soda and straw.'),
       (2, 1, 'Chill martini glass with soda water and ice.'),
       (2, 2, 'Fill mixing glass to top with ice.'),
       (2, 3, 'Add the dry vermouth to the mixing glass, giving a small stir to coat the ice with the vermouth. Drain out glass, leaving just the coating on the ice.'),
       (2, 4, 'Add the gin to the mixing glass.'),
       (2, 5, 'Stir for 15 seconds, always making sure that the glass is full to the brim with ice. Taste.'),
       (2, 6, 'Fine strain into chilled martini glass.'),
       (2, 7, 'Zest with lemon peel and add twist unto drink.'),
       (3, 1, 'Chill coupe glass with soda water.'),
       (3, 2, 'Add sugar to mixing tin and then add white rum and lime juice.'),
       (3, 3, 'Add a little cracked ice to the bottom then fill the rest of the tin with ice.'),
       (3, 4, 'Shake for 10 – 15 seconds, taste and then fine strain into coupe glass.'),
       (3, 5, 'Garnish glass with lime slice.'),
       (4, 1, 'Begin by chilling rocks glass with ice and soda water.'),
       (4, 2, 'Add 1 bar spoon of sugar into mixing glass.'),
       (4, 3, 'Add 2 dashes of Angostura bitters and 1 dash of orange bitters.'),
       (4, 4, 'Muddle to break down the sugar into a paste.'),
       (4, 5, 'Add the bourbon into a mixing glass and fill the rest of the mixing glass with ice.'),
       (4, 6, 'Stir with bar spoon for at least 20 seconds.'),
       (4, 7, 'Top up with ice and taste.'),
       (4, 8, 'Put ice into rocks glass and strain the drink into the glass.'),
       (4, 9, 'Zest the glass with orange peel and add twist into drink.'),
       (5, 1, 'Chill coupe glass with soda water.'),
       (5, 2, 'Add all ingredients to mixing tin with ice.'),
       (5, 3, 'Shake for 10 to 15 seconds.'),
       (5, 4, 'Fine strain into the chilled coupe glass.'),
       (5, 5, 'Flame an orange peel and place in drink as garnish.'),
       (6, 1, 'Cut 1/2 lime into 1/8 ths and add half of these to Rocks glass.'),
       (6, 2, 'Add teaspoon of brown sugar and muddle the ingredients.'),
       (6, 3, 'Add the rest of the lime and continue to muddle, to dissolve the sugar.'),
       (6, 4, 'Add the Cachaca and then add crushed ice on top.'),
       (6, 5, 'Stir to continue to dissolve the sugar.'),
       (6, 6, 'Add more crushed ice and continue to stir.'),
       (6, 7, 'Top up with crushed ice and garnish with lime wedge.'),
       (7, 1, 'For the perfect White Russian recipe add coffee liqueur to an old-fashioned glass.'),
       (7, 2, 'Add other ingredients to mixing tin and fill to brim with ice.'),
       (7, 3, 'Shake for 10 -15 seconds.'),
       (7, 4, 'Single strain the ingredients over the ice and coffee liqueur.'),
       (7, 5, 'Sprinkle with chocolate powder and garnish with coffee bean.'),
       (8, 1, 'Chill highball glass.'),
       (8, 2, 'Add all ingredients to mixing tin and fill with ice. Shake vigorously for 10 – 15 seconds.'),
       (8, 3, 'Fill highball glass with fresh ice and strain drink into glass.'),
       (8, 4, 'Garnish with pineapple slice, add straw and serve.'),
       (9, 1, 'Add all ingredients (except creme de mure) into mixing glass.'),
       (9, 2, 'Fill mixing glass with cubed ice and fill rocks glass with crushed ice.'),
       (9, 3, 'Shake for 10 seconds.'),
       (9, 4, 'Strain mixture into glass and top up with crushed ice.'),
       (9, 5, 'Pour creme de mure over drink using bar spoon.'),
       (9, 6, 'Garnish with 2 lemon slices and blackberry.'),
       (10, 1, 'Begin by half soaking rim of coupe glass with lime juice and then dab in salt.'),
       (10, 2, 'Use cloth to tidy up the glass for presentation.'),
       (10, 3, 'Add all ingredients into mixing tin with 2 ice cubes and dry shake for 10 seconds.'),
       (10, 4, 'Fill mixing tin with ice and shake for a further 10 – 15 seconds.'),
       (10, 5, 'Fine strain into the pre-prepared coupe glass.'),
       (11, 1, 'Add rum into rocks glass and squeeze the lime wedges over the top.'),
       (11, 2, 'Give quick churn with bar spoon and top up with ice.'),
       (11, 3, 'Fill to brim with cola and add in lime wedge as garnish.'),
       (12, 1, 'Chill a highball glass with ice.'),
       (12, 2, 'Pour all the ingredients, apart from red wine, into mixing tin and add ice.'),
       (12, 3, 'Roll the mixing tin for 15 seconds. Taste.'),
       (12, 4, 'Add ice to glass and single strain the drink into a glass.'),
       (12, 5, 'Add a splash of red wine and a dash of pepper.'),
       (12, 6, 'Garnish with 3 cucumber slices.'),
       (13, 1, 'Chill cocktail glass with ice and soda.'),
       (13, 2, 'Fill a mixing glass with ice and then add all ingredients.'),
       (13, 3, 'Using a bar spoon, stir the drink for approximately 20 seconds. When stirring, always ensure the glass is topped up with ice.'),
       (13, 4, 'Taste and then strain into the chilled cocktail glass, serving straight up.'),
       (13, 5, 'Zest the drink and glass with the orange peel and then twist and place in glass.'),
       (14, 1, 'Add all ingredients into a Boston cocktail shaker and fill with ice.'),
       (14, 2, 'Shake hard for up to 30 seconds to achieve the desired consistency of the drink.'),
       (14, 3, 'Double strain the contents of the shaker into a chilled martini glass.'),
       (14, 4, 'Garnish with 3 coffee beans.'),
       (15, 1, 'Pour the tequila, cassis, and lime juice into a cocktail shaker filled with ice.'),
       (15, 2, 'Shake well.'),
       (15, 3, 'Strain into a Collins glass filled with ice.'),
       (15, 4, 'Top with ginger beer.'),
       (16, 1, 'Pour cranberry into glass first filled with ice.'),
       (16, 2, 'Dry shake the vodka with grapefruit and layer on top of the cranberry.'),
       (16, 3, 'Garnish with lime wedge.'),
       (17, 1, 'Mix the ingredients in a shaker which is half full of ice.'),
       (17, 2, 'Strain and serve in a sugar-rimmed glass.'),
       (17, 3, 'Garnish with a strip of lemon rind.'),
       (18, 1, 'One rocks glass is packed with ice and water to chill the glass.'),
       (18, 2, 'In a second rocks glass, muddle the sugar cube with the bitters.'),
       (18, 3, 'Add the rye to this mixture.'),
       (18, 4, 'Stir to combine.'),
       (18, 5, 'Empty the ice from the first glass.'),
       (18, 6, 'Pour the absinthe into the glass and swirl to coat the sides of the glass.'),
       (18, 7, 'Any excess absinthe is discarded.'),
       (18, 8, 'Pour the rye/sugar/bitters mixture into the coated glass.'),
       (18, 9, 'Twist a lemon peel over the glass and rub the rim of the glass with the peel.'),
       (18, 10, 'The peel can be discarded or placed in the cocktail.'),
       (19, 1, 'Fill a highball glass with crushed ice.'),
       (19, 2, 'Add the lime juice and cranberry juice.'),
       (19, 3, 'Top with sparkling water and add an orange wedge for garish.'),
       (20, 1, 'Pour the peach nectar into a champagne flute.'),
       (20, 2, 'Slowly top with the sparkling cider.'),
       (20, 3, 'Garnish with a peach.'),
       (21, 1, 'In a cocktail shaker, combine the mint sprigs and blackberry syrup; muddle.'),
       (21, 2, 'Add the lime juice and ice. Shake to blend and chill.'),
       (21, 3, 'Pour into a rocks glass half-filled with ice.'),
       (21, 4, 'Top with the club soda. Stir.'),
       (21, 5, 'Garnish with mint sprigs, lime slices, and blackberries.');
       
INSERT INTO ingredients_categories_ingredients(ingredient_category_id, cocktail_ingredients_id)
VALUES (1, 4),
       (1, 5),
       (1, 6),
       (1, 7),
       (1, 9),
       (1, 10),
       (1, 11),
       (1, 13),
       (1, 14),
       (1, 17),
       (1, 19),
       (1, 21),
       (1, 24),
       (1, 25),
       (1, 27),
       (1, 29),
       (1, 30),
       (1, 31),
       (1, 32),
       (1, 33),
       (1, 34),
       (1, 35),
       (1, 37),
       (1, 39),
       (1, 40),
       (1, 41),
       (1, 42),
       (1, 43),
       (1, 44),
       (1, 45),
       (1, 46),
       (1, 48),
       (1, 51),
       (1, 53),
       (1, 54),
       (1, 55),
       (1, 56),
       (1, 57),
       (1, 58),
       (1, 59),
       (1, 60),
       (1, 61),
       (1, 62),
       (1, 64),
       (1, 66),
       (1, 67),
       (1, 68),
       (1, 69),
       (1, 70),
       (1, 71),
       (1, 72),
       (1, 73),
       (1, 74),
       (1, 76),
       (1, 77),
       (1, 78),
       (1, 79),
       (1, 80),
       (1, 82),
       (1, 84),
       (1, 85),
       (1, 86),
       (1, 87),
       (1, 90),
       (1, 91),
       (1, 94),
       (1, 99),
       (1, 100),
       (1, 104),
       (1, 116),
       (1, 120),
       (1, 121),
       (1, 125),
       (2, 2),
       (2, 3),
       (2, 8),
       (2, 12),
       (2, 15),
       (2, 20),
       (2, 28),
       (2, 112),
       (3, 97),
       (3, 101),
       (3, 103),
       (3, 113),
       (4, 50),
       (4, 88),
       (4, 93),
       (4, 106),
       (4, 107),
       (4, 108),
       (4, 109),
       (4, 110),
       (4, 111),
       (4, 117),
       (5, 1),
       (5, 16),
       (5, 47),
       (5, 63),
       (5, 65),
       (5, 83),
       (5, 92),
       (5, 95),
       (5, 118),
       (5, 129),
       (6, 22),
       (6, 36),
       (6, 49),
       (6, 52),
       (6, 75),
       (6, 96),
       (6, 98),
       (6, 119),
       (6, 126),
       (6, 127),
       (6, 128),
       (7, 26),
       (7, 81),
       (8, 18),
       (8, 23),
       (8, 38),
       (8, 89),
       (8, 102),
       (8, 105),
       (8, 114),
       (8, 115),
       (8, 122),
       (8, 123),
       (8, 124);