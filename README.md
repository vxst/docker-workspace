# Usage

Start the container:

```bash
docker run -v /Users/vxst/workdir/home:/home -d --rm --name workspace vxst/workspace
```

Go into Debian!

```bash
docker exec -it workspace byobu
```
