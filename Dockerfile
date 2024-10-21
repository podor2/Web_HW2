# Docker-команда FROM указывает базовый образ контейнера
# Наш базовый образ - это Linux с предустановленным python-3.10
FROM python:3.13.0-slim

# Установим переменную окружения
ENV APP_HOME=/app

# Установим рабочую директорию внутри контейнера
WORKDIR $APP_HOME

#Скопируем файлы  в рабочую директорию контейнера 
COPY . .


# Установим зависимости внутри контейнера
RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --only main


# Обозначим порт где работает приложение внутри контейнера
EXPOSE 5000

# Запустим наше приложение внутри контейнера
ENTRYPOINT ["python", "contact_helper.py"]
