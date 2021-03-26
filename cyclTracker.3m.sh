#! /usr/bin/env PYTHONIOENCODING=UTF-8 python3
#
#  <xbar.title>cyclTracker</xbar.title>
#  <xbar.version>v1.0</xbar.version>
#  <xbar.author>Kenton Kwok</xbar.author>
#  <xbar.author.github>kwokkenton</xbar.author.github>
#  <xbar.desc>Tracks occupancy of Santander Cycle Stations in London using the tfl API.</xbar.desc>
#  <xbar.dependencies>python</xbar.dependencies>

# List of docking stations, separated by commas. First will be highlighted in task bar.
STATIONS = ['Imperial College', 'Exhibition Road']


# You do not need to edit anything beyond here! ######################
import json
import requests

def get_id(location):
    """ location is a precise streetname,
        looks for station ID (string) from tfl API and returns it
    """
    response = requests.get("https://api.tfl.gov.uk/BikePoint/Search?query={0}".format(location))
    station = json.loads(response.text)

    try:
        id = station[0]['id']
        return id
    except:
        return None


def get_info(id):
    """ uses tfl API to obtain key data from station
        returns dictionary of station name, bikes present, empty stations, total stations.
    """
    response = requests.get("https://api.tfl.gov.uk/BikePoint/{0}".format(id))
    stn = json.loads(response.text)

    info = {}
    info['name'] = stn["commonName"]
    info['bikes'] = stn["additionalProperties"][6]['value']
    info['empty'] = stn["additionalProperties"][7]['value']
    info['total'] = stn["additionalProperties"][8]['value']
    return info


def toolbar(id):
    """ prints string for toolbar use
    """
    if id is None:
        print('🚲' + 'NA')
    else:
        info = get_info(id)
        present = info['bikes'] + '/' + info['total']
        print('🚲 ' + present)
    return

def dropdown(id):
    """ prints string for dropdown use
    """
    if id is None:
        print('NA: cannot find station')
    else:
        info = get_info(id)
        present = info['bikes'] + '/' + info['total']
        print(info['name'] + ' ' + present)
    return

if __name__ == '__main__':

    id = get_id(STATIONS[0])
    toolbar(id)

    print('---')

    for location in STATIONS:
        id = get_id(location)
        dropdown(id)

    print('🚴 Wear a helmet! | color=pink')
