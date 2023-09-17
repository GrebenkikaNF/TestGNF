﻿#language: ru

@tree

Функционал: проверка документа Расход товара

Как Менеджер я хочу
проверить документ Расход товара
чтобы проверить все движения документа   

Переменные:
*ПроверяемыеЗначенияСуммы
	| 'Имя'             | 'Представление' | 'Значение' |
	| 'ТоварыИтогСумма' | 'Сумма (итог)'  | '925,00'   |
*ПроверяемыеЗначенияКоличесва
	| 'Имя'                  | 'Представление'     | 'Значение' |
	| 'ТоварыИтогКоличество' | 'Количество (итог)' | '25,00'    |

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создания документа, проведение и проверки документа
* Открытие формы создания документа
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	Тогда открылось окно 'Продажи товара'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Продажа товара (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Товары"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'       |
		| '000000013' | 'Магазин "Продукты"' |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И я запоминаю значение поля "Покупатель" как "$Покупатель$"
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	Тогда элемент формы с именем "Склад" стал равен 'Малый'
	И я запоминаю значение поля "Склад" как "$Склад$"
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	Тогда открылось окно 'Продажа товара (создание) *'
* Заполнение табличной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И В таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000027' | 'Ряженка'      |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Продажа товара (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10,00'
	И в таблице "Товары" я завершаю редактирование строки
	И я запоминаю значение поля с именем 'ТоварыТовар' таблицы 'Товары' как '$ТоварПервойСтроки$'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И В таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно "Товары"
	И в таблице "Список" я перехожу к строке
		| 'Код'       | 'Наименование' |
		| '000000004' | 'Сметана'      |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Продажа товара (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '15,00'
	И в таблице "Товары" я завершаю редактирование строки
	И я запоминаю значение поля с именем 'ТоварыТовар' таблицы 'Товары' как '$ТоварВторойСтроки$'
* Проверка количества и суммы
	И у элемента формы с именем "ТоварыИтогКоличество" текст редактирования стал равен 'ПроверяемыеЗначенияКоличесва.ТоварыИтогКоличество.Значение'
	И у элемента формы с именем "ТоварыИтогСумма" текст редактирования стал равен 'ПроверяемыеЗначенияСуммы.ТоварыИтогСумма.Значение'
	И я нажимаю на кнопку "Записать"
* Номер документа
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровести'
* Проверка движение документа по регистрам
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
	Тогда таблица "Список" стала равной:
		| 'Период' | 'Регистратор' | 'Номер строки' | 'Контрагент'   | 'Сумма'  | 'Валюта' |
		| '*'      | '*'           | '1'            | '$Покупатель$' | '925,00' | 'Рубли'  |
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
	Тогда таблица "Список" стала равной:
		| 'Период' | 'Регистратор' | 'Номер строки' | 'Покупатель'   | 'Товар'               | 'Количество' | 'Сумма'  |
		| '*'      | '*'           | '1'            | '$Покупатель$' | '$ТоварПервойСтроки$' | '10,00'      | '550,00' |
		| '*'      | '*'           | '2'            | '$Покупатель$' | '$ТоварВторойСтроки$' | '15,00'      | '375,00' |
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
	Тогда таблица "Список" стала равной:
		| 'Период' | 'Регистратор' | 'Номер строки' | 'Товар'               | 'Склад'   | 'Количество' |
		| '*'      | '*'           | '1'            | '$ТоварПервойСтроки$' | '$Склад$' | '10,00'      |
		| '*'      | '*'           | '2'            | '$ТоварВторойСтроки$' | '$Склад$' | '15,00'      |
	И Я закрываю окно 'Продажа * от *'
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$' |
* Проверка печатной формы документа
	И в таблице "Список" я перехожу к строке:
		| 'Номер' |
		| '$Номер$' |
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R3C2' равна 'Номер'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R3C3' равна '$Номер$'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R5C2' равна 'Покупатель'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R5C3' равна '$Покупатель$'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R6C2' равна 'Склад'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R6C3' равна '$Склад$'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R7C2' равна 'Сумма'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R7C3' равна '925 рублей (Девятьсот двадцать пять рублей)'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R10C2' равна 'Товар'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R11C2' равна '$ТоварПервойСтроки$'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R12C2' равна '$ТоварВторойСтроки$'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R10C3' равна 'Цена'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R11C3' равна '55'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R12C3' равна '25'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R10C4' равна 'Количество'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R11C4' равна '10'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R12C4' равна '15'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R10C5' равна 'Сумма'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R11C5' равна '550'
	И в табличном документе 'SpreadsheetDocument' ячейка с адресом 'R12C5' равна '375'
	И я закрываю текущее окно
	И я закрываю все окна клиентского приложения
	
