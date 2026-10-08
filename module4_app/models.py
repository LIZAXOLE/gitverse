# models.py
# Модель данных. Здесь нет ни одной строки с tkinter:
# модель только хранит и изменяет данные и отвечает значениями.

USERS = [
    {"login": "admin", "password": "admin", "role": "Администратор",
     "full_name": "Администратор Системы", "locked": False, "attempts": 0},
    {"login": "ivanov", "password": "1234", "role": "Пользователь",
     "full_name": "Иванов Иван", "locked": True, "attempts": 3},
    {"login": "petrov", "password": "qwerty", "role": "Пользователь",
     "full_name": "Петров Пётр", "locked": False, "attempts": 0},
]


def all_users():
    """Возвращает весь список пользователей."""
    return USERS


def find_user(login, password):
    """Ищет пользователя по паре логин-пароль. Возвращает словарь или None."""
    for u in USERS:
        if u["login"] == login and u["password"] == password:
            return u
    return None


def user_by_login(login):
    """Возвращает запись по логину или None."""
    for u in USERS:
        if u["login"] == login:
            return u
    return None


def login_exists(login):
    """Проверяет, занят ли логин."""
    for u in USERS:
        if u["login"] == login:
            return True
    return False


def add_user(login, password, role, full_name):
    """Добавляет нового пользователя."""
    USERS.append({"login": login, "password": password, "role": role,
                  "full_name": full_name, "locked": False, "attempts": 0})


def update_user(login, password, role, full_name):
    """Меняет данные существующей записи. True при успехе, иначе False."""
    user = user_by_login(login)
    if user is None:
        return False
    user["password"] = password
    user["role"] = role
    user["full_name"] = full_name
    return True


def delete_user(login):
    """Удаляет запись. True при успехе, иначе False."""
    user = user_by_login(login)
    if user is None:
        return False
    USERS.remove(user)
    return True


def register_fail(login):
    """Увеличивает счётчик неудач; при третьей подряд блокирует.
    True возвращает только в момент случившейся блокировки."""
    for u in USERS:
        if u["login"] == login:
            u["attempts"] = u["attempts"] + 1
            if u["attempts"] >= 3:
                u["locked"] = True
                return True
            return False
    return False


def reset_attempts(login):
    """Обнуляет счётчик неудач после успешного входа."""
    for u in USERS:
        if u["login"] == login:
            u["attempts"] = 0
            return True
    return False


def unlock_user(login):
    """Снимает блокировку и обнуляет счётчик."""
    for u in USERS:
        if u["login"] == login:
            u["locked"] = False
            u["attempts"] = 0
            return True
    return False