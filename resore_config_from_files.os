#Использовать v8runner

Перем ПутьКБазе;
Перем ИмяПользователя;
Перем ПарольПользователя;
Перем ПапкаДляЗагрузки;

Процедура ЗапросВводаДанных(Сообщение, Переменная, ПроверкаЗаполнения = Ложь, УстанавливатьПустуюСтроку = Ложь)
  Сообщить(Сообщение);
  Если НЕ ВвестиСтроку(Переменная) И ПроверкаЗаполнения Тогда
    Сообщить("Значение не может быть пустым");
    ЗавершитьРаботу(0);
  КонецЕсли;
КонецПроцедуры

ИмяПользователя = "";
ПарольПользователя = "";

ЗапросВводаДанных("Укажите путь к файловой базе:", ПутьКБазе, Истина);
ЗапросВводаДанных("Укажите имя пользователя (опционально):", ИмяПользователя);
ЗапросВводаДанных("Укажите пароль пользователя (опционально):", ПарольПользователя);
ЗапросВводаДанных("Укажите папку для загрузки", ПапкаДляЗагрузки, Истина);

Конфигуратор = Новый УправлениеКонфигуратором();
Конфигуратор.УстановитьКонтекст("/F" + ПутьКБазе, ИмяПользователя, ПарольПользователя);
Попытка
  Конфигуратор.ЗагрузитьКонфигурациюИзФайлов(ПапкаДляЗагрузки);
Исключение
  Сообщить(Конфигуратор.ВыводКоманды());
КонецПопытки
