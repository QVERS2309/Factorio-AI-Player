# Sensors

## Назначение

Sensors — единственный модуль, который читает состояние мира Factorio.

Никакой другой модуль не должен напрямую работать с поверхностью (`surface`), сущностями (`entities`) или тайлами (`tiles`).

---

## Ответственность

Sensors отвечает только за получение информации.

Он никогда:

- не двигает игрока;
- не изменяет мир;
- не принимает решений.

---

## Интерфейс

### Игрок

get_player_position()

Возвращает координаты игрока.

---

### Цель

get_target_direction()

Возвращает направление к цели.

---

### Препятствия

is_blocked(direction)

Возвращает:

true

или

false

---

### Сущности

get_entities(radius)

Возвращает список объектов вокруг игрока.

---

### Ресурсы

find_nearest_resource(name)

Например:

iron-ore

Вернуть ближайшее месторождение.

---

### Вода

is_water(position)

true / false

---

### Свободная клетка

is_walkable(position)

true / false

---

## Кто использует Sensors

Navigation

↓

Pathfinding

↓

Mining

↓

Combat

↓

Building

---

## Что запрещено

Brain не обращается к Surface.

Planner не ищет деревья.

Movement не читает карту.

Вся информация о мире приходит только через Sensors.