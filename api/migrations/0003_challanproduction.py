# Generated by Django 5.1.2 on 2024-11-14 11:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_category_product_delete_catagory_delete_products'),
    ]

    operations = [
        migrations.CreateModel(
            name='ChallanProduction',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'challan_production',
                'managed': False,
            },
        ),
    ]
