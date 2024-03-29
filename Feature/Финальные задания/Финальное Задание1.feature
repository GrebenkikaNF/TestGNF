﻿#language: ru

@tree

Функционал: проверка добавления картинок в справочник Номенклаура

Как Менеджер по продажамя хочу
Проверить добавление картинки
чтобы обновить информацию о товаре

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка добавления картинки
	И Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=8ca0000d8843cd1b11dc8cfecc6a7df5"
	Тогда открылось окно 'Ряженка (Товар)'
	И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
	Тогда открылось окно 'Файлы'
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Ряженка (Товар) *'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна 'Ряженка (Товар) *' в течение 20 секунд
	И я закрываю все окна клиентского приложения
