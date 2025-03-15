# Анализ показателей образовательной платформы

## Cтек использованных технологий 
<img src="https://github.com/devicons/devicon/blob/master/icons/postgresql/postgresql-original.svg" height="40"/><img src="https://336118.selcdn.ru/Gutsy-Culebra/products/Redash-Logo.png" height="40"/>

## Основные цели 
  
  Целью работы было расчет основных метрик по данным работы образовательной платформы для групп участвовавших в A/B–тестировании.  

## Полученные результаты 

Был составлен запрос расчитывающий для тестовой и контрольной групп следующие метрики: ARPU, ARPAU, CR в покупку, СR активного пользователя в покупку, CR пользователя из активности по математике в покупку курса по математике.
  
|test_grp | arpu | arpau | cr_to_pay | cr_to_pay_active | cr_to_pay_active_math |
|-------------|-------------|-------------|-------------|-------------|-------------|
| control | 4,540 | 10,905 | 4 | 11 | 6 |
| pilot  | 11,508 | 35,364 | 10 | 26 | 9 |
 
<h2 align="center"><img src="https://github.com/Daniil-Pavlov/analysis_educational_platform/blob/main/newplot%20(1).png?raw=true" height="300"/><img src="https://github.com/Daniil-Pavlov/analysis_educational_platform/blob/main/newplot.png?raw=true" height="350"/>
 </h2>



