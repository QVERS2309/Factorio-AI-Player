# Factorio AI Player Architecture

## Core

Brain
Planner
Task
Blackboard
Memory
Knowledge

## Navigation

Navigation
Pathfinding
Route
Movement
Sensors

## Gameplay

Mining
Building
Inventory
Combat
Research

## Utilities

Logger
Math2D
Directions
Config
Profiler

## Runtime

Controller
Events

---

# Dependency Graph

Brain
    ↓
Planner
    ↓
Task
    ↓
Navigation
    ↓
Pathfinding
    ↓
Route
    ↓
Movement

Sensors ─────────────┐
Memory ──────────────┤
Knowledge ───────────┤
Blackboard ──────────┘