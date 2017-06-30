# Fukafuka

A tiny web application for load testing.
(Fuka (負荷) means 'load' in Japanese :rabbit:)

## Usage

### Production with Docker

```
$ docker-compose build
$ docker-compose up
```

Pre built images is here https://hub.docker.com/r/mozamimy/fukafuka/

### Development

```
$ bundle install
$ bundle exec rackup
```

## Usage

### GET /prime

```
$ curl http://localhost:9292/prime?num=50
{"status":"ok","result":[[2,1],[5,2]]}
```

### GET /hexdigest

```
$ curl "http://localhost:9292/hexdigest?str=rabbit&iteration=1000000"
{"status":"ok","result":"d37d96b42ad43384915e4513505c30c0b1c4e7c765b5577eda25b5dbd7f26d89"}
```

### GET /hello/revision

You should put `REVISION` file on application root directory.

```
$ curl http://localhost:9292/hello/revision
245753efa210be10d3f38809ad8cd46f231e388a
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Mozamimy/fukafuka.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

