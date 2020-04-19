# Operating Room Assistant App

Application for managing hospital resources, patient admissions and reserving operating theatres.  

## Preliminaries

* get [_Node.js_](https://nodejs.org/en/) v12 or higher
* get [_sqlite_](https://www.sqlite.org/download.html) (Windows only; pre-installed on Mac/Linux)
* _npm set @sap:registry_ to the latest _nexus snapshots_:

```sh
npm set @sap:registry=https://npm.sap.com
```

## Setup

Copy & paste this to your command line:

```sh
git clone https://github.com/scongia/or-assistant.git
cd or-assistant
npm run setup
```

## Run
```sh
npm run build:deploy:startv2
```

## Test

Open these links in your browser:

* <http://localhost:4004> &ndash; Fiori Launchpad sandbox
