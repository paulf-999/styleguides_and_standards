from diagrams import Cluster
from diagrams import Diagram
from diagrams import Edge
from diagrams.generic.os import Ubuntu
from diagrams.programming.language import Bash

# from diagrams.onprem.workflow import Airflow

# from diagrams.programming.language import Python
# from diagrams.saas.analytics import Snowflake

with Diagram("Ubuntu Setup on Windows", show=False, filename="ubuntu_setup_using_wsl"):
    ubuntu = Ubuntu("Ubuntu")
    ubuntu << Edge(label="abc")

    with Cluster("Makefile"):
        deps = Bash("make deps")

        deps_ubuntu = Bash("make deps_ubuntu")

    ubuntu >> deps >> deps_ubuntu
