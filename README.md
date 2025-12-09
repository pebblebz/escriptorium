eScriptorium is part of the [Scripta](https://www.psl.eu/en/scripta), [RESILIENCE](https://www.resilience-ri.eu) and [Biblissima+](https://projet.biblissima.fr/) projects, and has received funding from Université PSL and from The European Union's [Horizon 2020 Research and Innovation Programme](https://ec.europa.eu/programmes/horizon2020/en/what-horizon-2020) under Grant Agreement no. 871127, from the Programme d'investissements d'avenir of the [Agence Nationale de Recheche](https://anr.fr/fr/france-2030/france-2030/) under Grant Reference no. ANR-21-ESRE-0005, as well as from other contributors listed below. Its goal is provide researchers in the humanities with an integrated set of tools to transcribe, annotate, translate and publish historical documents.
The eScriptorium app itself is at the 'center'. It is a work in progress but will implement at least automatic transcriptions through kraken, indexation for complex search and filtering, annotation and some simple forms of collaborative working such as sharing and versioning.

## Mohawk College Specific Info
    The docker compose yaml file was adjusted. Some services did not run with the default from the github. This may be machine specific. All containers must run in docker or something will break. Although the mail service doesn't work, the service itself stays running without crashing. 

## Postgres Backup
    .tar and .sql files of the most recent postgres database can be found in the backup folder of this repo. You will need to import this into the postgres container to get any segmented documents.
    Projects are user specific. You will have to login to the user provided to get access to the documents. You should be able to share projects to different users as well. However, the mail service was not functional. So you would need to fix this or make the connection manually in the data base.

    A powershell script was made to simplify future backups. Just run ./backupPostgres.ps1 with the container running in the folder where the script is located (This repos root)

# ENV Variables.
    A decent amount of Kraken vars are set here make sure to check it.
    Load threads is overridden manually in the app/apps/core/tasks.py file. Once we started doing training with over 100 documents an error would occur otherwise. I would investigate fixing this as it does slow down training substantially.

# Hyper Params
    All hyper params have to be set manually in the app/apps/core/tasks.py file. You will have to stop and restart the container for these changes to take effect. We did not have time to do major changes to the base website.

# Escriptorium documentation
- [Main Doc](https://escriptorium.readthedocs.io/en/latest/)
- [Deploying](https://gitlab.com/scripta/escriptorium/-/wikis/Deploying)
    - This has a lot of helpful steps for setting up docker for escriptorium. Especially how to connect your GPU.
    - The wiki as a whole also has a lot of helpful tips.
    
## The stack
- nginx
- uwsgi
- [django](https://www.djangoproject.com/)
- [daphne](https://github.com/django/daphne) (channel server for websockets)
- [celery](http://www.celeryproject.org/)
- postgres
- [elasticsearch](https://www.elastic.co/)
- redis (cache, celery broker, other disposable data)
- [kraken](http://kraken.re)
- [docker](https://www.docker.com/) (deployment)


## Install
Two options,
- [install with Docker](https://gitlab.com/scripta/escriptorium/-/wikis/docker-install), or a
- [full local install](https://gitlab.com/scripta/escriptorium/-/wikis/full-install).

eScriptorium needs either Linux, macOS or Windows (with WSL).


## Contributing
See [Contributing to eScriptorium](https://gitlab.com/scripta/escriptorium/-/wikis/contributing).

## Steering Committee

- Daniel Stoekl Ben Ezra (EPHE-PSL, UMR AOROC 8546)
- Peter Stokes (EPHE-PSL, UMR AOROC 8546)
- Benjamin Kiessling (EPHE-PSL, UMR AOROC 8546)
- Robin Tissot (EPHE-PSL, UMR AOROC 8546)
- Mathew Barber (Aga Khan University, Institute for the Study of Muslim Civilisations)
- David Smith (Northeastern University)
- Thibault Clérice (Inria)
- Hassen Aguili (Inria)

## Current financial and technical contributors include:
- [École Pratique des Hautes Études (EPHE)](https://www.ephe.psl.eu)
- [Biblissima+](https://projet.biblissima.fr/)
- [Resilience](https://www.resilience-ri.eu/)
- [PSL Scripta](https://scripta.psl.eu/en/)
- [Institut national de recherche en sciences et technologies du numérique (INRIA)](https://inria.fr/en)
- [Archives nationales de France](https://www.archives-nationales.culture.gouv.fr/)
- [L’Institut de recherche et d’histoire des textes](https://www.irht.cnrs.fr/)
- [Open Islamicate Texts Initiative (OpenITI)](https://openiti.org/)
- [The Andrew W. Mellon Foundation](https://mellon.org/grants/)

