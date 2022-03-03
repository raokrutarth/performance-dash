import getpass
import bcrypt

"""
Quick script to generate hashed version of passwords
"""

password = getpass.getpass("password: ")
hashed_password = bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt())
print(hashed_password.decode())
