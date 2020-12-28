# generate data

from faker import Faker
from random import randint
from random import uniform
from random import choice

MAX_N = 1001

def generate_museums():
	faker = Faker()
	f = open('museums.csv', 'w')
	for i in range(1, MAX_N):
		line = "{0};{1};{2}\n".format(
										i, 
										faker.company(), 
										faker.city())
		print(line)		
		f.write(line)
	f.close()


generate_museums()

