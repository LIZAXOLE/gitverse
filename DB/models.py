from sqlalchemy import *
from sqlalchemy.orm import *
#DATABASE_URL = "postgresql+psycopg2://postgres:admin@localhost:5432/nmo"
DATABASE_URL = "sqlite:///appy.db"
engine = create_engine(DATABASE_URL, echo=False)

class Base(DeclarativeBase):
    """Базовый класс моделей."""

class User(Base):
    __table__ = Table("Users", Base.metadata, autoload_with=engine)  

def _to_dict(user):
    """Преобразует объект User в словарь для GUI."""
    if user is None:
        return None
    return {
        "id": user.id,
        "login": user.login,
        "password": user.password,
        "role": user.role,
        "full_name": user.full_name,
        "locked": bool(user.is_locked),
        "attempts": user.attempts,
    }

def all_users():
    """Возвращает список всех пользователей."""
    with Session(engine) as session:
        users = session.scalars(select(User).order_by(User.id)).all()
        return [_to_dict(u) for u in users]

def find_user(login, password):
     """Ищет пользователя по логину и паролю. Если нет — None."""
     with Session(engine) as session:
        user = session.scalars(select(User).where(User.login == login, User.password == password)).first()
        return _to_dict(user)

def user_by_login(login):
    """Возвращает пользователя по логину (или None)."""
    with Session(engine) as session:
        user = session.scalars(select(User).where(User.login == login)).first()
        return _to_dict(user)

def login_exists(login):
    """Есть ли пользователь с таким логином."""
    return user_by_login(login) is not None

def add_user(login, password, role, full_name):
    """Добавляет нового пользователя."""
    with Session(engine) as session:
        session.add(
            User(
            login=login,
            password=password,
            full_name=full_name,
            role=role,
            is_locked=0,
            attempts=0,
            )
            )
        session.commit()

def update_user(login, password, role, full_name):
    """Меняет пароль, роль и ФИО пользователя."""
    with Session(engine) as session:
        user = session.scalars(select(User).where(User.login == login)).first()
        if user is None:
            return False
        user.password = password
        user.role = role
        user.full_name = full_name
        session.commit()
        return True

def delete_user(login):
    """Удаляет пользователя."""
    with Session(engine) as session:
        user = session.scalars(select(User).where(User.login == login)).first()
        if user is None:
            return False
        session.delete(user)
        session.commit()
        return True

def register_fail(login):
    """Добавляет попытку входа. При 3 попытках блокирует пользователя.
    Возвращает True, если пользователь только что заблокирован.
    """
    with Session(engine) as session:
        user = session.scalars(select(User).where(User.login == login)).first()
        if user is None:
            return False
        user.attempts = user.attempts + 1
        if user.attempts >= 3:
            user.is_locked = 1
            session.commit()
            return True
        session.commit()
        return False

def reset_attempts(login):
    """Сбрасывает счётчик неудачных попыток входа."""

    with Session(engine) as session:
        user = session.scalars(select(User).where(User.login == login)).first()
        if user is None:
            return False
        user.attempts = 0
        session.commit()
        return True

def unlock_user(login):
    """Разблокирует пользователя и сбрасывает попытки."""
    with Session(engine) as session:
        user = session.scalars(select(User).where(User.login == login)).first()
        if user is None:
            return False
        user.is_locked = 0
        user.attempts = 0
        session.commit()
        return True

if __name__ == "__main__":
    for user in all_users():
        print(user)

