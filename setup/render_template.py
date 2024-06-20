"""
Render a project-config.jam file with the correct Python (conda) pointers
"""
import os
from jinja2 import Template

# Set by setup_script.sh
conda_env_path = os.environ['CONDA_ENV_PATH']

template_fname = "project-config.template"
output_fname = "project-config.jam"

fin = open(template_fname, 'r')
raw_contents = fin.read()
fin.close()

pop_contents = Template(raw_contents).render(conda_env_path=conda_env_path)

fout = open(output_fname, 'w')
fout.write(pop_contents)
fout.write("\n")
fout.close()