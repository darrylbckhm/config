export PATH="$HOME/.cargo/bin:$PATH"

complete -C /usr/local/bin/terraform terraform

project_init() {
    mkdir $1
    cd $1
    git init
    echo "# , $1" >> README.md
    echo "import os\n
    import sys\n
    import setuptools\n\n\n"


    if not hasattr(sys, 'real_prefix'):\n
        sys.path.append(os.path.dirname(__file__))\n\n


    with open('README.md', 'r') as fh:\n
        long_description = fh.read()\n\n\n


    setuptools.setup(\n
        name=$1,\n
        version='0.0.1',\n
        description=$1,\n
        long_description=long_description,\n
        long_description_content_type='text/markdown',\n
        packages=setuptools.find_packages(),\n
        include_package_date=True,\n
        install_requires=[\n
            'pytest',\n
        ],\n
        entry_points={\n
              'console_scripts': ['ftf=bin.$1:main'],\n
          },\n
        classifiers=[\n
            'Programming Language :: Python :: 3',\n
            'License :: OSI Approved :: MIT License',\n
            'Operating System :: OS Independent',\n
        ],\n
        python_requires='>=3.6',\n
    )"
    git push -u origin master
}
