# CRAN package crawler

This app is a package crawler that crawls all package repository from CRAN.

## How to setup?

##### Assumptions:

- RVM installed (https://rvm.io/)
- postgresql installed

Run the following codes

```cd cran-package-data-extractor```

```bundle install```

```rake db:create```

```rake db:migrate```

Run test to verify everything

```bundle exec rspec```

Output should be

```24 examples, 0 failures```

## How to use?

You need to run the crawler to retrieve package data

run

```rails s```

visit [http://localhost:3000/packages/enqueu_crawlers](http://localhost:3000/packages/enqueu_crawlers)

Once you received the response below, watch your terminal to see the progress.

```json
{
    "status": 200,
    "message": "Package crawler enqueued, scheduled to run on: 2020-02-02 00:00:00 UTC"
}
```

Once done, visit [http://localhost:3000/packages](http://localhost:3000/packages) to see the list of package versions

You can verify the records from rails console

do ```rails c```

```Package.all```

## Modules

```CranPackage::Extract```
Extracts the package informations from the repository pages

```CranPackage::Sanitize```
Simple sanitizes the string data. Removes unnecessary characters, extract user informations and etc.

```CranPackage::List```
Get the lists of package names

```CranPackage::StoreSummary```
Stores the package, package versions, package authors and package maintainers to the database

```CranPackage::Exceptions```
CranPackage transaction related exceptions
Used to handle exceptions during crawling process
