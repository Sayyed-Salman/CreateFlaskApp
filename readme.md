# Create a Flask Application Template with PowerShell

CreateFlaskApp v0.01

- Pull the repo and run the following command to create a new Flask application template.

```powershell
Set-ExecutionPolicy Unrestricted
```

```powershell
.\CreateFlaskApp.ps1
```

## What does it do?

- Creates an application factory flask application template

```bash
app/
    __init__.py
    routes.py
    models.py
    templates/
        base.html
    static/
        css/
        js/
config.py
wsgi.py
```

## Run the application

```bash
python wsgi.py
```
