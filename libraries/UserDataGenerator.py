import random
import string
from robot.api.deco import keyword
from robot.api import logger

class UserDataGenerator:

    def __init__(self):
        self._user_data = {}

    def _random_string(self, length=6):
        return "".join(random.choices(string.ascii_lowercase, k=length))

    def _random_digits(self, length=4):
        return "".join(random.choices(string.digits, k=length))

    @keyword("Generate User Data")
    def generate_user_data(self, role="Admin", status="Enabled"):

        username = f"auto_{self._random_string()}"
        password = f"Test@{self._random_digits()}"

        employee_name = "Ranga Akunuri"

        self._user_data.clear()
        self._user_data.update({
            "username": username,
            "password": password,
            "role": role,
            "status": status,
            "employee_name": employee_name
        })

        logger.info("===== GENERATED USER DATA =====", also_console=True)
        logger.info(f"Username       : {username}", also_console=True)
        logger.info(f"Password       : {password}", also_console=True)
        logger.info(f"Role           : {role}", also_console=True)
        logger.info(f"Status         : {status}", also_console=True)
        logger.info(f"Employee Name  : {employee_name}", also_console=True)
        logger.info("================================", also_console=True)

        return username, password, role, status

    @keyword("Get Created Username")
    def get_created_username(self):
        return self._user_data.get("username")

    @keyword("Get Created Password")
    def get_created_password(self):
        return self._user_data.get("password")

    @keyword("Get Created Role")
    def get_created_role(self):
        return self._user_data.get("role")

    @keyword("Get Created Status")
    def get_created_status(self):
        return self._user_data.get("status")

    @keyword("Get Created Employee Name")
    def get_created_employee_name(self):
        return self._user_data.get("employee_name")
