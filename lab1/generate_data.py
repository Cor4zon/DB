# generate data

from faker import Faker
from random import randint
from random import uniform
from random import choice

MAX_N = 1000


def generate_museums():
    faker = Faker()
    f = open('museums.csv', 'w')
    for i in range(MAX_N):
        line = "{0};{1};{2}\n".format(i + 1, faker.company(), faker.city())
        print(line)
        f.write(line)
    f.close()


def generate_artists():
    faker = Faker()
    f = open('artists.csv', 'w')
    for i in range(MAX_N):
        line = "{0};{1};{2};{3}\n".format(i + 1, faker.name(), faker.name(), faker.city())
        f.write(line)
    f.close()


def generate_artObjects():
    faker = Faker()
    f = open('artObjects.csv', 'w')
    for i in range(MAX_N):
        line = "{0};{1};{2};{3}\n".format(i + 1, faker.name(), randint(1, 1000), randint(1, 1000))
        f.write(line)
    f.close()


def generate_contracts():
    faker = Faker()
    f = open('contracts.csv', 'w')
    for i in range(MAX_N):
        date_in = faker.date()
        date_out = faker.date()
        if (date_in > date_out):
            date_in, date_out = date_out, date_in
        print(date_out)
        print(date_in)
        line = "{0};{1};{2};{3};{4};{5};{6}\n".format(
                                            i + 1,
                                            randint(1, 1000),
                                            randint(1, 1000),
                                            randint(1, 1000),
                                            date_in,
                                            date_out,
                                            randint(1,1000))
        f.write(line)
    f.close()


def generate_exhibitions():
    faker = Faker()
    f = open('exhibitions.csv', 'w')
    for i in range(MAX_N):
        line = "{0};{1};{2};{3};{4}\n".format(
                                            i + 1,
                                            faker.company() + "exh.",
                                            faker.city(),
                                            randint(50, 300),
                                            randint(1, 1000))
        f.write(line)
    f.close()

# generate_museums()
# generate_artObjects()
# generate_artists()
# generate_exhibitions()
generate_contracts()