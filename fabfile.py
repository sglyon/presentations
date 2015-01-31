"""
Simple fabfile to prepare the website

@author : Spencer Lyon <spencer.lyon@stern.nyu.edu>
@date : 2015-01-26 09:17:09

"""
import re
import

# list of potential suffixes
suffixes = [".slides.html",  # ipynb
            ]

# list of file to be included in output folder
to_output = ["TasteOfJulia/TasteOfJulia.slides.html",
             ]


def _camel_to_spaces(s):
    "Camel case to string separated by spaces"
    return str.join(" ", re.findall("[A-Z][^A-Z]*", s))


def _get_base_name(n, suffixes=suffixes):
    "strips any of the suffixes away"
    name = n.split("/")[-1]


def write_index(names):
    """
    writes index.html including an ul of li containing links to
    presentations
    """
    pass
