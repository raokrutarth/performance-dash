import getpass
import bcrypt

"""
Quick script to generate hashed version of passwords for prom

Use https://httpd.apache.org/docs/2.4/programs/htdigest.html for cadvisor.

grafana - plain-text config?
"""

password = getpass.getpass("password: ")
hashed_password = bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt())
print(hashed_password.decode())
