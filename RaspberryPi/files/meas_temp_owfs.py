#!/usr/bin/python
# -*- coding: utf-8 -*-
    
def main():
    import os,sys
    import time
    from datetime import datetime as dt

    OWPATH  = '/mnt/1wire/'
    SENSOR  = 'DS18B20'
    SUBDIR  = ('temperature','type','id','r_id')
    sensors = []
    
    for d in os.listdir(OWPATH):
        paths = { x:os.path.join(OWPATH,d,x) for x in SUBDIR}
        if all([os.path.exists(x) for x in paths.values()]) == True:
            info = {'path':paths['temperature']}
            for x in SUBDIR[1:]:
                with open(paths[x]) as f:
                    info[x] = f.read()
            info['r_id'] = info['r_id'].lower()
            sensors.append(info)
            # print info
    if len(sensors) == 0:
        sys.exit()
    sensors.sort(key = lambda x : x['r_id'])

    # os.system('echo 1 > /mnt/1wire/simultaneous/temperature; sleep 1')
    with open(os.path.join(OWPATH,'simultaneous/temperature'),'w') as f:
        f.write('1')
    time.sleep(1)
    
    tm   = dt.now().strftime('%Y-%m-%d %H:%M:%S')
    data = ''
    
    for s in sensors:
        with open(s['path']) as f:
            temp  = '{0:.4f}'.format(float(f.read()))
            data += '\t'.join([tm, s['r_id'], temp]) + '\n'

    fpath    = os.path.dirname(__file__)
    fname    = os.uname()[1] + '_temp_' + dt.today().strftime('%Y%m%d') + '.log'
    filename = os.path.join(fpath,'log',fname)
    with open(filename,'a') as f:
        f.write(data)


if __name__ == "__main__":
    main()

