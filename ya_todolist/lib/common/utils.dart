String printDate(DateTime? today) {
  return (today == null)
      ? ' '
      : "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
}
