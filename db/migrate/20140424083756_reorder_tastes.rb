# encoding: utf-8

class ReorderTastes < ActiveRecord::Migration
  def up
    new =
        [["Классический","Original"],["Голубика","Blueberry"],["Манго","Mango"],["Кокос","Coconut"],["Арбуз","Watermelon"],["Ананас","Pineapple"],["Соленая карамель","Caramel"],["Мята","Mint"],["Зеленый чай","Green_Tea"],["Фисташковый","Pistachio"],["Пина колада","Pina_Colada"],["Тутти фрутти","Tutti_Frutti"],["Шоколадный шок","Chocolate_Not_Sugar"],["Клубника в шоколаде","Chocolate_Strawberry"],["Шоколад","Chocolate"],["Малина в шоколаде","Chocolate_Rasberry"],["Ваниль","Vanilla_Bean"],["Мятный шоколад","Chocolate_Mint"],["Клубника","StrawBerry"],["Зеленое яблоко","Green_Apple"],["Малина","Raspberry"],["Виноград","Grape"],["Три ягоды","TripleBerry"],["Гранат","Pomegranate"],["Черничный чизкейк","Blueberry_Сheescake"],["Праздничный торт","Birthday_cake"],["Клубничный чизкейк","Strawberry_Сheescake"],["Печенье с кремом","Oreo"],["Клубничный бисквит","StrawBerry_Shortcake"],["Малиновый чизкейк","Raspberry_Сheescake"],["Персик","Peach"],["Маракуйя","PassionFruit"],["Папайя","Papaya"],["Гуава","Guava"],["Киви","Kiwi"],["Личи","Lychee"],["Черничный маффин","Blueberry_Maffin"],["Сливочные фрукты","CreamyFruit"],["Имбирное печенье","Ginger_Bread"],["Тыквенный пирог","PumpkinPie"],["Тропические фрукты","Tropical_Fruits"],["банановый пуддинг","Banana_Pudding"],["Таро","Taro"],["Малина-гранат","Raspberry_Pomegranat"],["Клубника-голубика","StrawBerry_Blueberry"],["Манго-персик","Mango_Peach"],["Ананас-гуава","Pineapple_Guava"],["Красная фасоль","RedBean"],["Манго-ананас","Mango_Peneapple"],["Клубника-банан","StrawBerry_Banana"],["Малина-апельсин","Raspberry_Orange"],["Апельсин-личи","Orange_Lychee"],["Манго-апельсин","Mango_Orange"],["Ананас-апельсин","Pineapple_Orange"],["Миндаль (постный)","Soy_Almond", 1],["Арахисовая паста (постный)","Soy_Peanut_Butter", 1],["Латте (постный)","Latte_Soy",1],["Таро (постный)","Soy_Taro", 1],["Банан (постный)","Soy_Banana_Milk", 1],["Бананово-арахисовая паста (постный)","Soy_Peanut_Butter_Banana", 1],["Красная фасоль (постный)","Soy_RedBean", 1],["Апельсин (сорбет)","Sorbet_Orange", 2],["Ананас-манго (сорбет)","Sorbet_Pineapple_Mango", 2]]

    codes = new.map { |pair| pair[1] }

    codes.each_with_index do |code, i|
      taste = Taste.where(code: code).first

      if taste.present?
        puts 'UPDATE: ' + code
        taste.sort_order = i + 1
        taste.save
      end
    end
  end

  def down
    Taste.update_all sort_order: nil
  end
end