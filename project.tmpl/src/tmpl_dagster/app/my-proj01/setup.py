from setuptools import find_packages, setup

setup(
    name="my_proj01",
    packages=find_packages(exclude=["my_proj01_tests"]),
    install_requires=[
        "dagster==1.8.13",
        "matplotlib",
        "pandas",
        "nbconvert",
        "nbformat"
    ],
    extras_require={"dev": ["dagster-webserver==1.8.13", "pytest"]},
)
