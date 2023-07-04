# Create a folder structure for a new project
Write-Host "Creating folder structure for new project" -NoNewline


New-Item -ItemType Directory -Force -Path "app"
New-Item -ItemType Directory -Force -Path "app\static"
New-Item -ItemType Directory -Force -Path "app\static\css"
New-Item -ItemType Directory -Force -Path "app\static\js"
New-Item -ItemType Directory -Force -Path "app\templates"


New-Item -ItemType File -Path "config.py"
New-Item -ItemType File -Path "wsgi.py"

New-Item -ItemType File -Path "app\__init__.py"
New-Item -ItemType File -Path "app\views.py"
New-Item -ItemType File -Path "app\models.py"
New-Item -ItemType File -Path "app\templates\base.html"

# Write content to files
# config.py

$Config = @"
import os

app_dir = os.path.abspath(os.path.dirname(__file__))


class Config(object):
    DEBUG = True
    TESTING = True
    SECRET_KEY = 'secret_key'
    SQLALCHEMY_DATABASE_URI = 'sqlite:///' + os.path.join(app_dir, 'app.db')


class ProductionConfig(Config):
    DEBUG = False
    TESTING = False
    DATABASE_URI = 'mysql://user@localhost/foo'


class DevelopmentConfig(Config):
    DEBUG = True


class TestingConfig(Config):
    TESTING = True
"@

$Config | Out-File -FilePath "config.py"


# wsgi.py

$Wsgi = @"
from app import create_app

app = create_app()

if __name__ == '__main__':
    app.run(debug=True)
"@

$Wsgi | Out-File -FilePath "wsgi.py"


# __init__.py

$Init = @"
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from config import Config

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    db.init_app(app)

    from app import views, models

    return app
"@

$Init | Out-File -FilePath "app\__init__.py"


# base.html

$Base = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Flask App</title>
</head>
<body>
    {% block content %}
    {% endblock %}
</body>
</html>
"@

$Base | Out-File -FilePath "app\templates\base.html"