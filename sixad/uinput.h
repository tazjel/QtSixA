/*
 * uinput.h
 *
 * This file is part of the QtSixA, the Sixaxis Joystick Manager
 * Copyright 2008-10 Filipe Coelho <falktx@gmail.com>
 *
 * QtSixA can be redistributed and/or modified under the terms of the GNU General
 * Public License (Version 2), as published by the Free Software Foundation.
 * A copy of the license is included in the QtSixA source code, or can be found
 * online at www.gnu.org/licenses.
 *
 * QtSixA is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 */

#ifndef UINPUT_H
#define UINPUT_H

#include <linux/input.h>
#include <linux/uinput.h>

#define MAX_RUMBLE_EFFECTS 16

#define JS_TYPE_SIXAXIS 1

int uinput_open(int JS_TYPE, const char *mac, struct device_settings settings);
int uinput_close(int fd, int debug=0);
int uinput_send(int fd, unsigned short type, unsigned short code, int value);

#endif // UINPUT_H
