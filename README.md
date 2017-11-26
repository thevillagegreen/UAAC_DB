# uaac-database

aidan-623

dulcet-equinox-184822:us-central1:uaac-database

35.184.227.103

Created a default .boto configuration file at [/Users/aidanirish/.boto]. See this file and
[https://cloud.google.com/storage/docs/gsutil/commands/config] for more
information about configuring Google Cloud Storage.
Your Google Cloud SDK is configured and ready to use!

* Commands that require authentication will use api1202@westminstercollege.edu by default
* Commands will reference project `dulcet-equinox-184822` by default
* Compute Engine commands will use region `us-west1` by default
* Compute Engine commands will use zone `us-west1-a` by default

Run `gcloud help config` to learn how to change individual settings

This gcloud configuration is called [default]. You can create additional configurations if you work with multiple accounts and/or projects.
Run `gcloud topic configurations` to learn more.

Some things to try next:

* Run `gcloud --help` to see the Cloud Platform services you can interact with. And run `gcloud help COMMAND` to get help on any gcloud command.
* Run `gcloud topic -h` to learn about advanced features of the SDK like arg files and output formatting

curl -o cloud_sql_proxy https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64

gcloud sql instances describe uaac-database:us-central1:dulcet-equinox-184822

./cloud_sql_proxy -instances="dulcet-equinox-184822:us-central1:uaac-database"=tcp:3306

-- if not authorized, use this command
gcloud auth application-default login
