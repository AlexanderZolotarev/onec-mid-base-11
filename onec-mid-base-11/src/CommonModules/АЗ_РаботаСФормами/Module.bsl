
#Область ПрограммныйИнтерфейс

// Добавляем реквизиты на форму объекта
Процедура ДополнитьФорму(Форма) Экспорт
	
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		ВставитьПолеСогласованнаяСкидкаИКоманду(Форма);
	ИначеЕсли  ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоПередОснование(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоПередСуммаДокумента(Форма);
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма)
	
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.АЗ_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ВставитьПолеКонтактноеЛицоПередОснование(Форма)
	
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.Основание);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.АЗ_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ВставитьПолеКонтактноеЛицоПередСуммаДокумента(Форма)
	
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.АЗ_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ВставитьПолеСогласованнаяСкидкаИКоманду(Форма)
	
	ГруппаСкидкаИПересчет = Форма.Элементы.Добавить("ГруппаСкидкаИПересчет", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево);
	ГруппаСкидкаИПересчет.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаСкидкаИПересчет.Группировка = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяВсегда;
	
	ПолеВвода = Форма.Элементы.Добавить("СогласованнаяСкидка", Тип("ПолеФормы"), Форма.Элементы.ГруппаСкидкаИПересчет);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.АЗ_СогласованнаяСкидка";
	ПолеВвода.УстановитьДействие("ПриИзменении", "АЗ_СогласованнаяСкидкаПриИзменении");
	
	Команда = Форма.Команды.Добавить("ПересчитатьТаблицу");
	Команда.Заголовок = "Пересчитать таблицу";
	Команда.Действие = "АЗ_ПересчитатьТаблицу";
	
	КнопкаФормы = Форма.Элементы.Добавить("КнопкаПересчитатьТаблицу", Тип("КнопкаФормы"), Форма.Элементы.ГруппаСкидкаИПересчет);
	КнопкаФормы.ИмяКоманды = "ПересчитатьТаблицу";
	КнопкаФормы.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	КнопкаФормы.Картинка = БиблиотекаКартинок.Перечитать;
	КнопкаФормы.Отображение = ОтображениеКнопки.КартинкаИТекст;

КонецПроцедуры

#КонецОбласти