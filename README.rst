IPX800V3
==========

A python library to control a IPX800 V3 device build by GCE-Electronics through its light "API".

* Python 3.8+ support
* WTFPL License

IPX800V3 features implemented
---------------------------

* Control:

  - outputs (``ipx.outputs[]``)
  - inputs (``ipx.intputs[]``)

Installation
------------

.. code-block:: console

    > pip install pyipx800v3-async

Usage
-----

.. code-block:: python

    import asyncio

    from src.pyipx800v3.pyipx800v3 import IPX800V3

    async def main():
        async with IPX800V3(host="127.0.0.1", port=80, username="username", password="password") as ipx:
            print(await ipx.ping())

            data = await ipx.global_get()

Links
-----

* GCE IPX800V3 API: https://download.gce-electronics.com/data/007_IPX800_V3/IPX_API.pdf

Licence
-------

Licensed under WTFPL License
