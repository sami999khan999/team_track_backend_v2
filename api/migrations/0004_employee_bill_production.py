# Generated by Django 5.1.2 on 2024-11-15 11:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0003_challanproduction'),
    ]

    operations = [
        migrations.CreateModel(
            name='employee_bill_production',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'employee_bill_production',
                'managed': False,
            },
        ),
    ]