from django.contrib import admin
from .models import Student, Course


class StudentInline(admin.TabularInline):
    model = Course.students.through
    verbose_name = 'Student'
    verbose_name_plural = 'Students'


@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
    inlines = [StudentInline, ]


@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    pass
