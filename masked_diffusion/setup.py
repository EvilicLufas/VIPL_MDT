# modified and added setup.py 24/2/21

from setuptools import setup, find_packages

setup(
    name="masked_diffusion",
    version="0.2.0",
    packages=find_packages(),
    install_requires=[
        # 'blobfile>=1.0.5',
        # 'torch',
        # 'tqdm',
    ],
)
