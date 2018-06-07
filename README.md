# README

## Add URL
To add pages you only need to change the `page-url` attribute in the curl
```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"pages", "attributes":{"page-url":"https://es.lipsum.com/"}}}' https://api-boilerplate-87.herokuapp.com/pages
```

## Show Pages and Contents
Index: [All Pages](https://api-boilerplate-87.herokuapp.com/pages).
Show: [One Page](https://api-boilerplate-87.herokuapp.com/pages/1).
