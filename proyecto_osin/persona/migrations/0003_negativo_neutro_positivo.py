# Generated by Django 2.0.4 on 2020-01-12 06:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('persona', '0002_auto_20180525_1903'),
    ]

    operations = [
        migrations.CreateModel(
            name='Negativo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
                ('tiempo_registro', models.DateTimeField(auto_now=True)),
                ('estado', models.CharField(default='1', max_length=2)),
            ],
        ),
        migrations.CreateModel(
            name='Neutro',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
                ('tiempo_registro', models.DateTimeField(auto_now=True)),
                ('estado', models.CharField(default='1', max_length=2)),
            ],
        ),
        migrations.CreateModel(
            name='Positivo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
                ('tiempo_registro', models.DateTimeField(auto_now=True)),
                ('estado', models.CharField(default='1', max_length=2)),
            ],
        ),
    ]
